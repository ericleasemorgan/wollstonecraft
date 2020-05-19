# Wollstonecraft

In this repository there are a few scripts used to "read" some of Mary Wollstonecraft's good works; this README outlines the contents of this repository's directories.

To begin with, there is a directory called "books", and there are three of them:

   1. french.txt
   2. men.txt
   3. women.txt

I'm sorry, but I don't exactly know from whence these files came, but they are the source of the investigations.

Second, there is a directory called "paragraphs". It too only contains three files where each file is derived from the files in the books directory. Each file is a set of records with two fields: 1) paragraph name, and 2) paragraph. These files were created with a scripts called "./bin/file2paragraphs.sh" and "./bin/file2paragraphs.pl". Given the files in this directory the student, researcher, or scholar can identify paragraphs of particular interest.

Third, there is a directory called "corpus". This directory contains a bunch of plain text files. Each file is a "paragraph" from a given text, where a paragraph is defined as sets of words delimited by blank lines. The files in this directory were created with a script called "./bin/paragraphs2corpus.pl". The content of this directory is especially useful for concordancing, topic modeling, and supervised machine learning ("classification") processes.

Forth and fifth, the directory called "themes" includes three subdirectories. Each subdirectory includes a set of paragraphs which exemplify the given theme. There are three of them, and they were created with a script called ".bin/paragraphs2themes.pl". The directory called "unclassified" includes all the paragraphs not included in the themes. This directory was created with the script named "./bin/paragraphs2unclassified.pl". Both the themes and unclassified directories were intended to support a supervised machine learning process, outlined below.

Sixth, there is the directory called "tmp" which is intended to hold temporary files.

The directories called "bin" and "etc" are used to do a lot of the work. The bin directory includes:

   * file2paragraphs.sh and file2paragraphs.pl - create the content in the paragraphs directory
   * paragraphs2corpus.pl - create the content of the corpus directory
   * paragraphs2themes.pl - create the content of the themes directory
   * paragraphs2unclassified.pl - create the content of the unclassified directory
   * train.sh and train.py - used together, these scripts create a file called "./etc/model.bin"
   * classify.py - given model.bin, this script tries to classify all of the unclassified documents
   * count.sh - given a file from a theme subdirectory, output the count & tabulation of words, and the output of this script is useful for creating word clouds as well as calculating the intersection of themes
   * venn.sh and venn.py - used in conjunction, these script create "./tmp/venn.png"
   * intersections.py - this script enumerates all of the words found in each discrete section of ./tmp/venn.png; this script creates the file named "./tmp/intersections.txt"
   
The etc directory contains a number of useful files/subdirectories:

   * en.txt - a list of stop (function) words which carry little or no meaning; these words are intended to be removed from processing because they tend to generate "noise"
   * all-words - a set of plain text files and image files. The plain text files are the words from the themes directory, and their associated image files illustrate the frequency of each word in a theme
   * sans-common - this directory is the same as all-word but with stop words removed

In the end, the "reading" process only somewhat useful. Three themes were enumerated: republicanism, liberalism, and feminism. Paragraphs exemplifying these themes were then identified and both the themes and unclassified directories were created. Using an algorithm called "Naive Bayes", a model was created and the unclassified documents were... classified. Unfortunately, the result was not very good; the resulting classifications did not make intuitive sense. It is my belief the exemplified paragraphs were too similar for the classifier to do its good work; the differences between liberalism and republicanism is/was too nuanced for the computer to distinguish.

Again, using the content of the themes directory, a Venn diagram was created. It illustrated how many words were in each section of the diagram. A file of the words in each section was then created. Using this file the student, researcher, or scholar can deduce what words are characteristic of each theme or combination thereof. 

Finally, the corpus directory can be quite instructive, if concordancing or topic modeling were applied against it. Using this directory and those tools, it is possible to calculate word frequencies, collocations, n-grams, statistically "interesting" words, and latent themes. Programs called "AntConc" and "Topic Modeling Tool" are good programs for these purpose.

In the end, this repository is not intended to output truth but rather to supplement the traditional reading process.  

---
Eric Lease Morgan &lt;emorgan@nd.edu&gt;  
May 19, 2020

