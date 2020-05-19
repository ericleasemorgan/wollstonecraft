#!/usr/bin/env perl


# configure books
use constant FRENCHPARAGRAPHS => './paragraphs/french.txt';
use constant MENPARAGRAPHS    => './paragraphs/men.txt';
use constant WOMENPARAGRAPHS  => './paragraphs/women.txt';

# configure output directory
use constant DIRECTORY => './unclassified';

# configure topics/themes
use constant FEMINISM      => ( 'women-00323', 'women-00270', 'women-00010', 'women-00197', 'women-00246', 'women-00865', 'women-01023', 'women-01087', 'women-01336', 'women-00388', 'women-00449', 'women-00275', 'men-00101', 'men-00129', 'men-00204', 'women-00271', 'women-00319', 'women-00218', 'women-00375' );
use constant LIBERALISM    => ( 'men-00019', 'french-00122', 'french-00125', 'men-00061', 'men-00139', 'women-00231', 'women-00430', 'women-00362', 'men-00020', 'men-00049', 'men-00238', 'women-00136', 'women-00236', 'french-00101', 'french-00725', 'french-00195', 'french-00703', 'french-00747', 'french-01105' );
use constant REPUBLICANISM => ( 'french-00010', 'french-00114', 'men-00170', 'women-00387', 'men-00087', 'men-00149', 'women-00138', 'french-01283', 'french-00212', 'french-00322', 'women-01223', 'women-00135', 'women-00430', 'men-00133', 'women-00010', 'men-00033', 'men-00078', 'women-00005', 'women-00232' );

# require
use strict;

# initialize
my @feminism      = FEMINISM;
my @liberalism    = LIBERALISM;
my @republicanism = REPUBLICANISM;
my @books         = ( MENPARAGRAPHS, WOMENPARAGRAPHS, FRENCHPARAGRAPHS );
my %paragraphs    = ();
my %keys          = ();
my $directory     = DIRECTORY;

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
		$paragraphs{ $key } = $paragraph;
	
	}
	close BOOK;
	
}

# create a list of keys
foreach ( @feminism )      { $keys{ $_ }++ }
foreach ( @liberalism )    { $keys{ $_ }++ }
foreach ( @republicanism ) { $keys{ $_ }++ }

# process each paragraph
foreach my $key ( sort keys %paragraphs ) {

	if ( ! $keys{ $key } ) {
	
		# re-initailize
		my $file = "$directory/$key.txt";
		my $paragraph = $paragraphs{ $key };
		open FILE, " > $file" or die "Can't open $file ($!)\n";
		print FILE $paragraph;
		close FILE;
		
	}
	
}
exit;

