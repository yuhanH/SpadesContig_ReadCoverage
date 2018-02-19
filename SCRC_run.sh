#!/bin/bash
#$ -cwd
#$ -S /bin/bash


contig=$1 
blast=$2
R1=$4
R2=$5

if [ -z "$6" ]
then
thread="4-12"
else
thread=$6
fi

module load samtools/1.3

module load bowtie2/2.2.7

samtools faidx $contig

seq_id=$(more $blast |  cut -f1)
for s in $seq_id
do
len=$(echo $s | cut -f 4 -d '_')
if [ $len -gt 200 ]
then
samtools faidx $contig $s >> $3.bowtie2.fasta
fi
done

bowtie2-build $3.bowtie2.fasta $3'_DB'

qsub -pe threaded $thread ./script/recalculate_read_coverage_bowtie2.sh $R1 $R2 $3  $3'_DB' $blast
