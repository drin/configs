#!/usr/bin/perl
use strict;
use warnings;

use constant PLUGIN_LIST_FILE => q{plugin_git_list};
use constant GIT_CMD_TEMPLATE => q{git -C %s clone %s};
use constant PLUGIN_DIR       => q{plugins};

open(PLUGIN_LIST_FD, q{<}.PLUGIN_LIST_FILE);
my @plugin_list = <PLUGIN_LIST_FD>;
close(PLUGIN_LIST_FD);

print(STDOUT "checking if directory ".PLUGIN_DIR." exists...\n");
if (! -d PLUGIN_DIR) {
   if (!$ENV{DEBUG}) {
      system('mkdir -p '.PLUGIN_DIR);
   }
}

print(STDOUT "fetching vim plugins from list of git repos...\n");
for my $plugin_git_repo (@plugin_list) {
   chomp $plugin_git_repo;

   if ($ENV{DEBUG}) {
      print(STDOUT sprintf(GIT_CMD_TEMPLATE, PLUGIN_DIR, $plugin_git_repo)."\n");
   }
   else {
      system(sprintf(GIT_CMD_TEMPLATE, PLUGIN_DIR, $plugin_git_repo));
   }
}
