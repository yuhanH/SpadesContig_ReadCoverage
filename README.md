# SpadesContig_ReadCoverage
It is built to calculate the coverage of assembled contigs using raw fastq reads.

It has six inputs.

$1: spades contig fasta (the name for each sequence should be in the default format, such as NODE_1_length_461346_cov_10.9601) 

$2: blast tabular ouput file

$3: output file name (the  parent directories should be existed)

$4: R1 fastq file

$5: R2 fastq file

$6: threaded number (optional, the default is 4-12)


demo:
sh SCRC_run.sh /ifs/data/tetzlab/raw/Oct11/spades_contig/G45047-contigs.fasta  /ifs/data/tetzlab/raw/Oct11/blast_results/G45047-contigs.fasta.blast  /ifs/home/yhao2/spades_contig_read_coverage/output/G45047  /ifs/data/tetzlab/raw/Oct11/fastq/G45047_pe_1.fastq.gz  /ifs/data/tetzlab/raw/Oct11/fastq/G45047_pe_2.fastq.gz
