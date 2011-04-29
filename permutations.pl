#! /usr/bin/perl -W
use strict;
use warnings;
##########################################################################
# The purpose of this script it to generate all permutations of a string #
##########################################################################

# 1) create a string to test with
my $string = "abc";
print "Length of the string is ".length($string)."\n";

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

    # determine the length of the input string
    $length = length($_[0]);

    # since the length of the string is one larger than indexes into the string
    # we set up a little logic to continuously get the proper string length 
    # to provide to the substring command 
    if ($length - $i != 1) {
     $length =  $i - $length + 1;
    }
    else {
      $length = 1;
    }

    my $char    = substr($_[0], $i  , $length);
    my $prefix  = substr($_[0], 0   , $i);
    my $postfix = substr($_[0], $i+1, length($_[0]) - $i);
    my $short = $prefix.$postfix;

    print "Current Letter: $char \tprefix $prefix \tpostfix $postfix\n";
 
    # this loop will start from the beginning of the prefix and
    # go until the position of the letter we have stripped off
    
    # here we have another off by one error since the length of the string is 1 shorter than it used to be
    for (my $j = 0; $j <= length($short); $j++) {
      my $lhs = substr($short, 0, $j);
      my $rhs = substr($short, $j, length($short) - $j);
      my $perm;

      if (length($lhs) == 0) {
        $perm = $char.$short;
      }
      elsif (length($rhs) == 0) {
        $perm = $short.$char;
      }
      else {
        $perm = $lhs.$char.$rhs;
      }

      print "The permuatation is: $perm\t LHS: $lhs\tCHAR: $char\tRHS: $rhs\n";
      $permutations {$perm} = 1;

    }
  }

  while ((my $key, my $value) = each(%permutations)) {
     print $key."\n";
  }
my $count = scalar keys %permutations;
print $count."\n";

}


