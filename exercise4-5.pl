#!/usr/bin/perl -w
#Author: Nandita Rahman
#Class: BINF634 Fall 2017
#Exercise 4-5   Using substituting function to change to RNA to DNA

#Use this RNA template
$RNA = 'AACGGGAGGACGGGAAAAUUACUACGGCAUUAGC';

#Now you can print this after storing your template as a variable
print "Here is the starting RNA:\n\n";

print "$RNA\n\n";

#Next rev-transcribe your RNA by substituting all of your U's with T's - make sure you save this as a new variable

$DNA = $RNA;

$DNA =~ s/U/T/g;

#Print the resulting DNA into the screen

print "Here is the result of reverse-transcribing the RNA back into DNA: \n\n";

print "$DNA\n";

#Exit program

exit;