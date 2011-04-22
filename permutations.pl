#! /usr/bin/perl -W
use strict;
use warnings;

# The purpose of this script it to generate all permutations of a string

# create a string to test with
my $string = "abcd";

# call our function
&getPerms($string);

sub getPerms($) {
  #first we'll get the last character from the string
  my $last = substr($_[0], -1);
  print $last."\n";
}


