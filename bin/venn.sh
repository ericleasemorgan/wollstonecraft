#!/usr/bin/env bash

# venn.sh - given three sets of word counts & tabulations, output a Venn diagram

VENN='./bin/venn.py'
COUNT='./bin/count.sh'
FEMINISM='./themes/feminism'
LIBERALISM='./themes/liberalism'
REPUBLICANISM='./themes/republicanism'

$COUNT $FEMINISM > ./tmp/counts-feminism.txt
$COUNT $LIBERALISM > ./tmp/counts-liberalism.txt
$COUNT $REPUBLICANISM > ./tmp/counts-republicanism.txt

