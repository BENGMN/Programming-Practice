#! /usr/bin/perl -W
use strict;
use warnings;
##########################################################################
# The purpose of this script it to generate all permutations of a string #
##########################################################################

# 1) create a string to test with
my $string = "abcdfg";

# 2)  call our function
&getPerms($string);


###################################
# This is where the magic happens #
###################################

sub getPerms($) {
  # get the last character from the string
  my $last = substr($_[0], -1);

  # determine the length of the string
  if ( length($_[0]) > 1 ) {
    &getPerms(substr($_[0], 0, -1));
  }
  else {
    print $_[0];
  }

#  print length($_[0])."\n";
#  print $last."\n"; # debugging line
}


