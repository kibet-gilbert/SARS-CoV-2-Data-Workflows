#!/usr/bin/env bash

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ];then echo -e "ERROR: You need to provided three args\nUSAGE: script <two-field-id> <in-one-per-line-fasta> <out-one-per-line-fasta>, respectively";exit;fi

rm $3 2> /dev/null
for line in `cat $1`
do
#id=`cut -d, -f2 <<< $i`
id1=`cut -d, -f1 <<< $line`
id2=`cut -d, -f2 <<< $line`
id3=`cut -d, -f3 <<< $line`
#echo -e ">${id2}_${id1}"
seq=`grep -A1 "$id1" $2 | tail -n1`
#echo $seq
#name=`cut -d, -f1 <<< $i`

#echo $name

#echo  -e ">${id2}_${id3}\n$seq" >> $3
echo  -e ">${id2}\n$seq" >> $3
#printf "$seq" >> gisaid_all_final.fasta
done
