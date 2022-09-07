#!/usr/bin/env bash
for i in `cat Outputs/phylo_ilri-wsu-kemri_ONT-IDs_nodup_18-10-2021.csv`
do
id=`sed 's/-/_/g' <<< $i`
#echo $id
seq=`grep -A1 "$id" all_COVC_KEM.nextclade.aligned_over70_cln.fasta | tail -n1`
#echo $seq
#name=`cut -d, -f1 <<< $i`

#echo $name
echo  -e ">$i\n$seq" >> phylo_ilri-wsu-kemri_ONT_final_19-10-2021.fasta
#printf "$seq" >> gisaid_all_final.fasta
done
