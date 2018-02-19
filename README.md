  
# Spades Contig Read Coverage
It is built to calculate the coverage of spades *de novo* assembly contigs by remapping raw fastq reads. SPAdes could be found http://cab.spbu.ru/software/spades/


## Input
It has six inputs.

$1: spades contig fasta (the name for each sequence should be in the default format, such as NODE_1_length_461346_cov_10.9601) 

$2: blast tabular ouput file (the first column is the name of contigs and the second column is the name of annotated subjects)

$3: output file name (the  parent directories should be existed)

$4: R1 fastq file

$5: R2 fastq file

$6: threaded number (optional, the default is 4-12)

## Demo:
```{bash eval=FALSE}
sh SCRC_run.sh /ifs/data/spades_contig/G45047-contigs.fasta  /ifs/data//blast_results/G45047-contigs.fasta.blast  /ifs/home/spades_contig_read_coverage/demo_output/G45047  /ifs/data/fastq/G45047_pe_1.fastq.gz  /ifs/data/fastq/G45047_pe_2.fastq.gz
```
spades contig fasta: /ifs/data/spades_contig/G45047-contigs.fasta 

blast tabular output: /ifs/data//blast_results/G45047-contigs.fasta.blast  

output file name: /ifs/home/spades_contig_read_coverage/demo_output/G45047 (the directory __/ifs/home/spades_contig_read_coverage/demo_output/__ should be existed)

R1,R2 fastq files:  /ifs/data/fastq/G45047_pe_1.fastq.gz     /ifs/data/fastq/G45047_pe_2.fastq.gz
## Output
