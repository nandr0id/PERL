#!/usr/bin/perl -w
#Author: Nandita Rahman
#Class: BINF634 Fall 2017
#Exercise 5-2   Concatenating short DNA sequence followed by alignment

# Ask use to input DNA sequence
print "Please enter a short (4-6 base) of a DNA sequence of your choosing:\n\n";
$dna1 = <STDIN>;
chomp $dna1;

print "Okay thank you, now kindly enter one more short (4-6 base) DNA sequence:\n\n";

$dna2 = <STDIN>;
chomp $dna2;

#concatentate the DNA

$dna3 = $dna1 . $dna2; 

#now print the concatenated string

print "$dna3\n\n"


#Exit program

exit;