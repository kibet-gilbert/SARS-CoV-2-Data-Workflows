#!/usr/bin/env bash

for line in `cat ../gisaid_IDs-Name_seq16-21_02-11-2021.csv`
do
id1=`cut -d, -f1 <<< $line`
id2=`cut -d, -f2 <<< $line`

sed "s,${id1},${id2},"  ../gisaid_fasta_final_seq16-21_02-11-2021.fasta

done
