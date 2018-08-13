#!/usr/bin/perl
# File: cpg.cgi
use warnings;
use CGI qw(:standard); #output HTML commands
use CGI::Carp qw/fatalsToBrowser/;
my $url = "/nrahman6/cgi-bin/fasterfasta";

# File: FasterFasta.pl
# Author: Nandita Rahman
# Date: 27 Nov 2017
# Purpose: Input Fasta file, obtain analysis and percentage with two decimal places

print header;
print start_html('A Faster FASTA File Reader'),
	h3('Nucleotide Counter for FASTA file'),  #print form's header
	start_multipart_form, p, 
	"Click the button to choose a FASTA file:",
	br, filefield(-name=>'filename'), p,		#choose the file to be used
	reset, submit('submit','Submit File'), hr, endform;

if (param()) {		#executed after Submit is pressed
	my $filehandle = upload('filename');
	# variable declarations:
	my @header = ();		    # array of headers
	my @sequence = ();		    # array of sequences
	my $count = 0;	           # number of sequences

	# read FASTA file
	my $n = -1;			    # index of current sequence
	while (my $line = <$filehandle>) {
		chomp $line;		    # remove training \n from line
		if ($line =~ /^>/) { 	    # line starts with a ">"
		$n++;			    # this starts a new header
		$header[$n] = $line;	    # save header line
		$sequence[$n] = "";	    # start a new (empty) sequence
    }
    else {
		next if not @header;	    # ignore data before first header
		$sequence[$n] .= $line     # append to end of current sequence
		}
	}
	$count = $n+1;			  # set count to the number of sequences
	close INFILE;

	# remove white space from all sequences
	for (my $i = 0; $i < $count; $i++) {
    $sequence[$i] =~ s/\s//g;
	}

########## Sequence processing starts here:
##### REST OF PROGRAM



	# process the sequences
	print ("There are $count sequences in the input file<br>");
	my $total = 0;
	my $max = 0;
	my $min = 0;
	my $average = 0;
	my $seq = 0;
	my $i = 0;
	while ($i < $count) {
		$seq = length($sequence[$i]);  #this shows the total sequence length
		$total = $total + $seq;
		if ($i == 0) {
			$max = $seq;
			$min = $seq;   #at 1 sequence, it is both the max and min.
			}
		if ($i > 0 && $max < $seq) {  #this shows the max sequence length when $max is just below the highest $sequence
			$max = $seq;
			}
		if ($i > 0 && $min > $seq) {  #this shows the min sequence length when $min is just above the lowest $sequence.
			$min = $seq;
			}
		$i++;
	}
	$average = $total / $count;  #the average is the total length divided by the count of sequences.
	print ("Total sequence length = $total<br>");
	print ("Maximum sequence length = $max<br>");
	print ("Minimum sequence length = $min<br>");
	print ("Ave sequence length = $average<br>");

	my $i = 0;
	while ($i < $count) {
		my $A_count = 0;
		my $C_count = 0;
		my $G_count = 0;
		my $T_count = 0;
		my $CpG_count = 0;
		$seq = length($sequence[$i]);

	print ("$header[$i]<br>");	#this prints each header that starts with >
	print ("Length: $seq<br>");   #this shows the length of each corresponding sequence

	my $point = 0;
	while ($point < length $sequence[$i]) { #this block goes through each sequence and counts nucleotides and dinucleotide
		my $base = substr ($sequence[$i], $point, 1); #for nucleotides
		my $bases = substr ($sequence[$i], $point, 2); #for dinucleotides
		$A_count++ while ($base =~ /A/ig);
		$C_count++ while ($base =~ /C/ig);
		$G_count++ while ($base =~ /G/ig);
		$T_count++ while ($base =~ /T/ig);
		$CpG_count++ while ($bases =~ /CG/ig);
		$point++;
	}
	my $percent_A = 0;   #these help find the percent of each nucleotides (or dinucleotide)
	my $percent_C = 0;
	my $percent_G = 0;
	my $percent_T = 0;
	my $percent_CpG = 0;
	
	$percent_A = ($A_count / $seq);
	$percent_C = ($C_count / $seq);
	$percent_G = ($G_count / $seq);
	$percent_T = ($T_count / $seq);
	$percent_CpG = ($CpG_count / $seq);
	

	printf ("A-counts (bp):%4d %.2f<br>", $A_count, $A_count);  #the (di)nucleotide count and their percentages are printed.
	printf ("C-counts (bp):%4d %.2f<br>", $C_count, $C_count);
	printf ("G-counts (bp):%4d %.2f<br>", $G_count, $G_count);
	printf ("T-counts (bp):%4d %.2f<br>", $T_count, $T_count);
	printf ("CpG-counts (bp):%4d %.2f<br>", $CpG_count, $CpG_count);
	$i++;
	
	}
	print address( a({href=>$url},"Click here to submit another file."));
}
print end_html;
exit;