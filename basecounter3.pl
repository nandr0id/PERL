#!/usr/bin/perl
# File: basecounter2
#use strict;
#use warnings;
use CGI qw(:standard);
use CGI::Carp qw/fatalsToBrowser/;
my $url = "/jsolka/cgi-bin/basecounter2.pl";
print header;
print start_html('A Base Counter'),
    h3('A Nucleotide Counter'),
    start_multipart_form, p,
    "Click the button to choose a FASTA file:",
    br, filefield(-name=>'filename'), p,
    reset, submit('submit','Submit File'), hr, endform;
if (param()) {
    my $filehandle = upload('filename');
    # read whole file into @data array
    my @data = <$filehandle>; close $filehandle;
    # discard header line and put rest of file into $dna string
    shift @data; my $dna = join "", @data; $dna =~ s/\s//g;    

    # analyze the input data
    my $a = ($dna =~ tr/Aa//);  my $t = ($dna =~ tr/Tt//);
    my $c = ($dna =~ tr/Cc//);  my $g = ($dna =~ tr/Gg//);

    # output results to the HTML page
    print "The DNA is: $dna", p,
        "The base counts are: A = $a  C = $c  G = $g  T = $t", p, hr;
    print address( a({href=>$url},"Click here to submit another file."));
}
print end_html;
exit;

