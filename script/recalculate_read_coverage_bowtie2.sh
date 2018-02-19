#!/bin/bash
#$ -cwd
#$ -S /bin/bash

module load bowtie2/2.2.7
module load samtools/1.3

R1=$1
R2=$2
output=$3
DB=$4
BLAST=$5


bowtie2 -p $NSLOTS -x $DB   --no-unal  -1 $R1  -2 $R2 -S $output.sam

samtools view -bS $output.sam  |  samtools sort -o $output.bam


contig=$( samtools view $output.bam | cut -f3 | sort | uniq)

samtools depth   $output.bam > $output.base.depth
> $output.mean.depth
for c in $contig
do
mean=$(grep $c $output.base.depth | awk '{sum+=$3} END { print sum/NR}')
echo $c$'\t'$mean >> $output.mean.depth
done



module load python/3.4.3

p1=$output.mean.depth
p2=$BLAST
python -c "import sys;sys.path.append('./script');import  phage_abundance;mean='"${p1}"';blast='"${p2}"'; phage_abundance.f(mean,blast)"
