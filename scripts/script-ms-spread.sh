#!/usr/bin/env bash
for i in `cat KenyaDatedays_ids_pangoUsher.csv`
do
id=`cut -d, -f1 <<< $i`
rg=`cut -d, -f2 <<< $i`
ct=`cut -d, -f3 <<< $i`
lin=`cut -d, -f4 <<< $i`
#id=`sed 's/-/_/g' <<< $i`
#echo $id
seq=`grep -A1 "$id" USEDseqs_removed_underscores.fasta | tail -n1`
#echo $seq
#name=`cut -d, -f1 <<< $i`

#echo $id "_" $rg "_" $ct "_" $lin
echo  -e ">"$id"_"$rg"_"$ct"_"$lin"\n"$seq >> USEDseqs_spread.fasta
#printf "$seq" >> gisaid_all_final.fasta
done
