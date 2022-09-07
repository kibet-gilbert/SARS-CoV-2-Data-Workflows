#!/usr/bin/env bash

#SBATCH -p batch
#SBATCH -J mafft-6merpairs
#SBATCH -n 10
#SBATCH -w compute05
#SBATCH --qos vip
#SBATCH --mail-user douso@cgiar.org
#SBATCH --mail-type BEGIN
#SBATCH --mail-type END


#module load mafft/7.475

#input_dir=data
#out_dir=/var/scratch/douso/KemriPhylo

mafft --thread -1 \
--6merpair \
--keeplength \
--addfragments USEDseqs_spread.fasta SARS.fasta \
 > USEDseqs_spread.aln.fasta
