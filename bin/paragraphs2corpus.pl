#!/usr/bin/env perl


# configure books
use constant FRENCHPARAGRAPHS => './paragraphs/french.txt';
use constant MENPARAGRAPHS    => './paragraphs/men.txt';
use constant WOMENPARAGRAPHS  => './paragraphs/women.txt';
use constant DIRECTORY        => './corpus';

# require
use strict;

# initialize
my @books      = ( MENPARAGRAPHS, WOMENPARAGRAPHS, FRENCHPARAGRAPHS );
my %paragraphs = ();
my $directory  = DIRECTORY;

# process each book
foreach my $book ( @books ) {

	# read a book
	open BOOK, " < $book " or die "Can't open $book ($!)\n";
	while ( <BOOK> ) {
	
		# parse
		chop;
		my $record = $_;
		next if ( ! $record );
		my ( $key, $paragraph ) = split ( /\t/, $record );
		
		# update the grand list of paragraphs
		my $file = "$directory/$key.txt";
		open FILE, " > $file" or die "Can't open $file ($!)\n";
		print FILE $paragraph;
		close FILE;
	
	}
	close BOOK;
	
}

# done
exit;

