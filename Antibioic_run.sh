
#!/bin/bash
#$ -cwd
#$ -S /bin/bash





RGIseq=$1 

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



samtools faidx $RGIseq



bowtie2-build $RGIseq $3'_RGI_DB'



qsub -pe threaded $thread ./script/recalculate_read_coverage_bowtie2.sh $R1 $R2 $3  $3'_RGI_DB' $blast


