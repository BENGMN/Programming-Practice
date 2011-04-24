#! /usr/bin/perl -W
use strict;
use warnings;
##########################################################################
# The purpose of this script it to generate all permutations of a string #
##########################################################################

# 1) create a string to test with
my $string = "abc";

print "Length of the string is ".length($string)."\n";
print "This is the first value ".substr($string, 0, -2)."\n";
print "This is the second value ".substr($string, 1, -1)."\n";
print "This is the third value ".substr($string, 2, 1)."\n";

print substr($string, 0, -3-0+1)."\n";


# 2)  call our function
&getPerms($string);


###################################
# This is where the magic happens #
###################################

sub getPerms($) {

  my %permutations; # we will use this hash to store the permutations 
  my $length;

  for (my $i = 0; $i < length($_[0]); $i++) {
    # get all of the letters in the string 1 character at a time
    # from left to right
    #                       Start   End

    $length = length($_[0]);           

    if ($length - $i != 1) {
     $length =  $i - $length + 1;
    }
    else {
      $length = 1;
    }

    my $last = substr($_[0], $i, $length);
    print "this is the last letter $last\n";
 
    # this loop will start from the beginning of the string and
    # go until the position of the letter we have stripped off
    for (my $j = 0; $j < $i; $j++) {
      $permutations {substr($_[0], 0, $j + 1).$last.substr($_[0],$j + 1, length($_[0]) - 1)} = $permutations{substr($_[0], 0, $j + 1).$last.substr($_[0], $j + 1, length($_[0]) - 1)} + 1;
    }

    # this loop will start from 1 after the position of the letter
    # that we have stripped from the string and go until the end
    for (my $k = $i+1; $k <= length($_[0]); $k++) {
      $permutations {substr($_[0], 0, $k - 1).$last.substr($_[0],$k + 1, length($_[0]) - 1)} = $permutations{substr($_[0], 0,$k-1).$last.substr($_[0],$k+1, length($_[0]) - 1 )} + 1;
    }
  
  }

  while ((my $key, my $value) = each(%permutations)) {
     print $key."\n";
  }
}


