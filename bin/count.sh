#!/usr/bin/env bash

# count.sh - given a directory containing plain text file, count & tabulate all the words in all the files

STOPWORDS='./etc/en.txt'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <directory>" >&2
	exit 2
fi

# get input
DIRECTORY=$1

# create an array of stopwords
STOPWORDS=$( cat $STOPWORDS )

# build a corpus and build a list of words
CORPUS=$( cat $DIRECTORY/*.txt )
CORPUS=$( echo $CORPUS | sed -e "s/[[:punct:]]\+//g" | sed -e "s/ +/ /g" | sed -e "s/ /\n/g" )

echo "$CORPUS" | ( while read WORD; do
		if [[ ! $STOPWORDS =~ ($WORD) ]]; then DICTIONARY+=" $WORD"; fi
	done

	# count & tabulate the words
	DICTIONARY=$( echo "$DICTIONARY" | sed -e "s/ /\n/g" | sort | uniq -c | sort -rn )

	# normalize
	DICTIONARY=$( echo "$DICTIONARY" | sed -e 's/^ *//' | sed -e 's/ /\t/' )

	# output and done
	printf "$DICTIONARY"
)

# done
exit
