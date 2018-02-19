
#should work in the mean.depth directory

def f(CoverageFile,BlastFile):
  OUTPUT=CoverageFile.replace(".mean.depth","_phage_cov.txt")
  phage_cov=dict()
  phage_cov_sum=dict()
  phage_len=dict()

  contig_cov=dict()
  contig_len=dict()

  contig_phage=dict()
  with open(CoverageFile) as f1,  open(BlastFile) as f2, open (OUTPUT,'w') as g:
    for line in f1:
        line=line.rstrip().split('\t')
        contig_cov[line[0]]=float(line[1])
        contig_len[line[0]]=int(line[0].split('_')[3])
    for line2 in f2:
        line2=line2.rstrip().split('\t')
        contig_phage[line2[0]]=line2[1]
    for k in contig_cov:
        phage=contig_phage[k]
        if phage in phage_cov_sum:
            phage_cov_sum[phage]=phage_cov_sum[phage]+contig_cov[k]*contig_len[k]
            phage_len[phage]=phage_len[phage]+contig_len[k]
        else:
            phage_cov_sum[phage]=contig_cov[k]*contig_len[k]
            phage_len[phage]=contig_len[k]
    for p in phage_cov_sum:
        phage_cov[p]=phage_cov_sum[p]/phage_len[p]
    for p2 in phage_cov:
        newline=p2+'\t'+str("{0:.4f}".format(phage_cov[p2]))+'\n'
        g.write(newline)
        
