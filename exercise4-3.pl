#!/usr/bin/perl -w
#Author: Nandita Rahman
#Class: BINF634 Fall 2017
#Exercise 4-3   Transcribing DNA into lowercase

# The DNA
$DNA = 'ACGGGAGGACGGGAAAATTACTACGGCATTAGC';

# Print the DNA onto the screen
print "Here is the starting DNA:\n\n";

print "$DNA\n\n";

print "Now let's change this to all lowercase:\n\n";

# Change the DNA to all lowercase
$DNA =~ tr/../a-z/;

print "$DNA\n";

# Exit the program.
exit;
