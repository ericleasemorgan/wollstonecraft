#!/usr/bin/env python

# venn.py - given a set of pre-calcluated frequencies, illustrate vocabulary overlap

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# November 12, 2018 - first cut; done via brute force


# configure
FEMINISM      = './tmp/counts-feminism.txt'
LIBERALISM    = './tmp/counts-liberalism.txt'
REPUBLICANISM = './tmp/counts-republicanism.txt'

# build data sets; feminism
feminism = []
data = open( FEMINISM ).read().split( '\n' )
for record in data : 
	fields = record.split( '\t' )
	feminism.append( fields[ 1 ] )
	
# liberalism
liberalism = []
data = open( LIBERALISM ).read().split( '\n' )
for record in data : 
	fields = record.split( '\t' )
	liberalism.append( fields[ 1 ] )
	
# republicanism
republicanism = []
data = open( REPUBLICANISM ).read().split( '\n' )
for record in data : 
	fields = record.split( '\t' )
	republicanism.append( fields[ 1 ] )

# set-tize
feminism      = set( feminism )
liberalism    = set( liberalism )
republicanism = set( republicanism )


# calculate various intersections; there are "only" seven different possibilities, sort of
F = sorted( feminism.difference( liberalism, republicanism ) )
L = sorted( liberalism.difference( feminism, republicanism ) )
R = sorted( republicanism.difference( liberalism, feminism ) )

FL = feminism.intersection( liberalism )
FL = sorted( FL.difference( republicanism ) )

FR = feminism.intersection( republicanism )
FR = sorted( FR.difference( liberalism ) )

LR = liberalism.intersection( republicanism )
LR = sorted( LR.difference( feminism ) )

FLR = sorted( feminism.intersection( liberalism, republicanism ) )

print( "feminism (F)", len(F) )
print( '; '.join( F ) )
print()

print( "liberalism (L)", len(L) )
print( '; '.join( L ) )
print()

print( "republicanism (R)", len(R) )
print( '; '.join( R ) )
print()

print( "F and L not R", len(FL) )
print( '; '.join( FL ) )
print()

print( "F and R not L", len(FR) )
print( '; '.join( FR ) )
print()

print( "L and R not F", len(LR) )
print( '; '.join( LR ) )
print()

print( "F and L and R", len(FLR) )
print( '; '.join( FLR ) )
print()


