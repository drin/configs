#!/usr/bin/perl
use strict;
use warnings;

use Cwd 'abs_path';

use constant GIT_CMD_TEMPLATE => q{git -C %s clone %s};

use constant HOME_VIM_DIR      => "$ENV{HOME}/.vim";
use constant VIM_AUTOLOAD_DIR  => HOME_VIM_DIR.q{/autoload};
use constant VIM_BUNDLE_DIR    => HOME_VIM_DIR.q{/bundle};

use constant VIM_TMP_DIR       => q{/var/tmp/vim};
use constant VIM_VIEW_DIR      => VIM_TMP_DIR.q{/view};
use constant VIM_SWAP_DIR      => VIM_TMP_DIR.q{/swap};

use constant PLUGIN_REPO_LIST  => q{vim/plugin_git_list};
use constant PATHOGEN_LOAD_DIR => q{vim/plugins/vim-pathogen/autoload};
use constant PLUGIN_DIR        => q{vim/plugins};

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

sub pull_plugins {
   my ($git_template, $repo_list_file, $plugin_dir) = (GIT_CMD_TEMPLATE, @_);
   my @repo_list = parse_plugin_repo_list($repo_list_file);

   print(STDOUT "fetching vim plugins from list of git repos...\n");
   for my $plugin_git_repo (@repo_list) {
      chomp $plugin_git_repo;

      if ($ENV{DEBUG}) {
         print(STDOUT sprintf($git_template, $plugin_dir, $plugin_git_repo)."\n");
      }
      else {
         system(sprintf($git_template, $plugin_dir, $plugin_git_repo));
      }
   }
}


################################################################################
#
# MAIN
#
################################################################################

my $script_home = abs_path($0);
$script_home =~ s/$0//g;

prepare_dir(HOME_VIM_DIR);
prepare_dir(VIM_VIEW_DIR);
prepare_dir(VIM_SWAP_DIR);

prepare_dir($script_home.PLUGIN_DIR);
pull_plugins($script_home.PLUGIN_REPO_LIST, PLUGIN_DIR);

link_dir(VIM_AUTOLOAD_DIR, $script_home.PATHOGEN_LOAD_DIR);
link_dir(VIM_BUNDLE_DIR, $script_home.PLUGIN_DIR);


__END__
