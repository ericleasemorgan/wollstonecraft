#!/usr/bin/env perl

use strict;
use File::Basename;

my $file = $ARGV[ 0 ];
if ( ! $file ) { die "Usage: $0 <file>\n" }

my $key = basename( $file, ( '.txt' ) );

my $text = &slurp( $file );
$text =~ s/\n/\n\n/g;
$text =~ s/\n\n+/\n/g;
my @paragraphs = split( /\n/, $text );

my $i = 0;
foreach my $paragraph ( @paragraphs ) {

	$i++;
	$paragraph =  lc( $paragraph );
	$paragraph =~ s/\d+//g;
	#$paragraph =~ s/\bwoman\b//g;
	#$paragraph =~ s/\bwomen\b//g;
	#$paragraph =~ s/\bman\b//g;
	#$paragraph =~ s/\bmen\b//g;
	#$paragraph =~ s/\breason\b//g;
	my $item   =  $key . '-' . sprintf( "%05d", $i );
	print "$item\t$paragraph\n";
	print "\n";

}

exit;

sub slurp {

	my $f = shift;
	open ( F, $f ) or die "Can't open $f: $!\n";
	my $r = do { local $/; <F> };
	close F;
	return $r;

}