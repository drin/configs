#!/usr/bin/perl
use strict;
use warnings;

use Cwd 'abs_path';

use constant GIT_CMD_TEMPLATE => q{git -C %s clone %s};

use constant HOME_VIM_DIR      => "$ENV{HOME}/.vim";
use constant VIM_AUTOLOAD_DIR  => HOME_VIM_DIR.q{/autoload};
use constant VIM_BUNDLE_DIR    => HOME_VIM_DIR.q{/bundle};
use constant VIM_COLOR_DIR     => HOME_VIM_DIR.q{/colors};

use constant VIM_TMP_DIR       => q{/var/tmp/vim};
use constant VIM_VIEW_DIR      => VIM_TMP_DIR.q{/view};
use constant VIM_SWAP_DIR      => VIM_TMP_DIR.q{/swap};

use constant PLUGIN_REPO_LIST  => q{plugin_list};
use constant COLOR_REPO_LIST   => q{color_list};

use constant PATHOGEN_LOAD_DIR => q{plugins/vim-pathogen/autoload};
use constant PLUGIN_DIR        => q{plugins};
use constant COLOR_DIR         => q{colors};

sub runtime_script_name {
   my ($exec_name) = (@_);
   $exec_name =~ m/.*\/(.*?)[.]?\w*$/;

   return $1;
}

sub prepare_dir {
   my ($dir) = (@_);

   print(STDOUT "checking if directory $dir exists...\n");
   if (! -d $dir) {
      if (!$ENV{DEBUG}) { system("mkdir -p $dir"); }
   }
}

sub link_dir {
   my ($from_dir, $to_dir) = (@_);

   if ($ENV{DEBUG}) { print(STDOUT "ln -s $to_dir $from_dir\n"); }
   else { system("ln -s $to_dir $from_dir"); }
}

sub parse_plugin_repo_list {
   my ($plugin_tab_file) = (@_);

   if (! -f $plugin_tab_file) {
      print(STDERR "unable to find file $plugin_tab_file\n");
   }

   open(PLUGIN_LIST_FD, "<$plugin_tab_file");
   my @repo_list = <PLUGIN_LIST_FD>;
   close(PLUGIN_LIST_FD);

   return @repo_list;
}

sub repo_name_from_url {
   my ($git_url) = (@_);

   $git_url =~ m/.*\/(.*?)[.]git$/;

   return $1;
}

sub pull_plugins {
   my ($git_template, $repo_list_file, $plugin_dir) = (GIT_CMD_TEMPLATE, @_);
   my @repo_list = parse_plugin_repo_list($repo_list_file);

   print(STDOUT "fetching vim plugins from list of git repos...\n");
   for my $plugin_git_repo (@repo_list) {
      chomp $plugin_git_repo;
      my $repo_name = repo_name_from_url($plugin_git_repo);

      print(STDOUT "fetching vim plugin '$repo_name'\n");

      if (-d "$plugin_dir/$repo_name") {
         print(STDOUT "plugin $repo_name has been pulled. skipping...\n");
         next;
      }

      if ($ENV{DEBUG}) {
         print(STDOUT sprintf($git_template, $plugin_dir, $plugin_git_repo)."\n");
      }
      else {
         system(sprintf($git_template, $plugin_dir, $plugin_git_repo));
      }
   }
}

sub setup_vim {
   my ($script_home) = (@_);

   prepare_dir(HOME_VIM_DIR);
   prepare_dir(VIM_VIEW_DIR);
   prepare_dir(VIM_SWAP_DIR);

   prepare_dir($script_home.PLUGIN_DIR);
   prepare_dir($script_home.COLOR_DIR);
   pull_plugins($script_home.PLUGIN_REPO_LIST, $script_home.PLUGIN_DIR);
   pull_plugins($script_home.COLOR_REPO_LIST, $script_home.COLOR_DIR);

   link_dir(VIM_AUTOLOAD_DIR, $script_home.PATHOGEN_LOAD_DIR);
   link_dir(VIM_BUNDLE_DIR, $script_home.PLUGIN_DIR);
   link_dir(VIM_COLOR_DIR, $script_home.COLOR_DIR);
}

sub cleanup_vim {
   my ($script_home) = (@_);

   my @vim_plugins = parse_plugin_repo_list($script_home.PLUGIN_REPO_LIST);
   my @vim_colors = parse_plugin_repo_list($script_home.COLOR_REPO_LIST);

   for my $plugin_url (@vim_plugins) {
      my $plugin_name = repo_name_from_url($plugin_url);

      if ($ENV{DEBUG}) { print(STDOUT "rm -rf ${script_home}plugins/$plugin_name\n"); }
      else { system("rm -rf ${script_home}plugins/$plugin_name"); }
   }

   for my $plugin_url (@vim_colors) {
      my $plugin_name = repo_name_from_url($plugin_url);

      if ($ENV{DEBUG}) { print(STDOUT "rm -rf ${script_home}colors/$plugin_name\n"); }
      else { system("rm -rf ${script_home}colors/$plugin_name"); }
   }
}

sub abs_path_from_script_name {
   my ($exec_name, $script_name) = (@_);
   my $script_home = abs_path($exec_name);

   # if we're executing in the same directory as the script, the script name
   # will be empty (because of not being able to match an initial [/])
   if (!$script_name) {
      $script_home =~ s/$exec_name//g;
   }
   else {
      $script_home =~ s/$script_name.*//g;
   }

   return $script_home;
}


################################################################################
#
# MAIN
#
################################################################################

if (scalar @ARGV < 1) {
   print(STDERR "perl setup_vim.pl <setup | cleanup>\n");
   exit(1);
}

my $exec_name = $0;
my $script_name = runtime_script_name($exec_name);
my $script_home = abs_path_from_script_name($exec_name, $script_name);

if ($ARGV[0] =~ m/cleanup/i) {
   cleanup_vim($script_home);
}
elsif ($ARGV[0] =~ m/setup/i) {
   setup_vim($script_home);
}
else {
   print(STDERR "unknown command $ARGV[0]\n");
}


__END__
