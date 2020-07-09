#/usr/bin/perl -w
use strict;
use Getopt::Long;

my %opt={
out=>"TMB.txt",
mutiple=>1
};

GetOptions(\%opt,"infile:s","multiple:f","out:s");
 $opt{infile} && -s $opt{infile} ||die"
Usage:perl $0 --infile oncoprint.txt --multiple 1 --out TMB.txt

";
open IN,"<",$opt{infile}||die"$!";
open OUT,">",$opt{out}||die"$!";

<IN>;
my %stat;
while(<IN>){
	chomp;
	my @list=split/\t/;
	$stat{$list[0]} +=1;
}

print OUT "name\tvalue\n";
for(sort keys %stat){
	my $value=$stat{$_}*$opt{multiple};
	print OUT "$_\t$value\n";
}
