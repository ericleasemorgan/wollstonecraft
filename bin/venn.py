#!/usr/bin/env pythonw

# venn.py - given a set of pre-calcluated frequencies, illustrate vocabulary overlap

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# November 12, 2018 - first cut; done via brute force


# configure
FEMINISM = './tmp/counts-feminism.txt'
LIBERALISM = './tmp/counts-liberalism.txt'
REPUBLICANISM = './tmp/counts-republicanism.txt'

# require
from matplotlib import pyplot as plt
from matplotlib_venn import *

# liberalism
liberalism = []
data = open( LIBERALISM ).read().split( '\n' )
for record in data : 
	fields = record.split( '\t' )
	liberalism.append( fields[ 1 ] )
	
# build data sets; feminism
feminism = []
data = open( FEMINISM ).read().split( '\n' )
for record in data : 
	fields = record.split( '\t' )
	feminism.append( fields[ 1 ] )
	
# republicanism
republicanism = []
data = open( REPUBLICANISM ).read().split( '\n' )
for record in data : 
	fields = record.split( '\t' )
	republicanism.append( fields[ 1 ] )
	
# do the work, output, and done
venn3( [ set( republicanism ), set( liberalism ), set( feminism ) ], ( 'R', 'L', 'F' ) )
plt.show()
exit()
