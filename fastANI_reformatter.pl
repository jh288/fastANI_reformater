#!/usr/bin/perl -w

use strict;
use warnings;

my $usage="$0 <fastANI to contvert>\n\n";

my $infile=$ARGV[0];

open (INFILE, "<$infile");

my %hash;
my $ind=0;
my $count=1;
my $first;
my @header_array;


while(<INFILE>){
	my $line=$_;
	my @line_array=split("\t",$line);
	if ($count==1){$first=$line_array[0]}
	$count++;

	if ($line_array[0] eq $first){push(@header_array, $line_array[1])}

	$hash{$line_array[0]}{$line_array[1]}=$line_array[2]
	}

foreach my $header_strain (@header_array){print "\t$header_strain"}
print "\n";
foreach my $vib (keys %hash){
	print "$vib";
	foreach my $strain (@header_array){
		print "\t$hash{$vib}{$strain}";
		}
	print "\n"
	}
