#!/usr/bin/perl -w
#Author: Nandita Rahman
#Class: BINF634 Fall 2017
#Exercise 4-4   Using string function to change to upper and lower cases

# The DNA
$DNA = 'ACGGGAGGACGGGAAAATTACTACGGCATTAGC';

# Print the DNA onto the screen
print "Here is the starting DNA, see how it is in all uppercase?\n\n";

print "\U$DNA\n\n";

print "Okay, well let's see what it would look like in all lowercase?\n\n";

print "\L$DNA\n\n";

print "Just in case you didn't want to keep it in lowercase, let's change it back to uppercase:\n\n";

print "\U$DNA\n\n";

print "Pretty neat, huh?\n\n";

# Exit the program.
exit;
