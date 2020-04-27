library(seqTools)

source('https://raw.githubusercontent.com/developing-bioinformatics/eDNA_BLAST/master/R/core.R')
download_sra(sample = 'OHara', dir.out = 'data')

files = list.files('data', pattern='OHara', full.names = TRUE)
files

labels = tools::file_path_sans_ext( basename(files) )
labels = stringr::str_replace(labels, '_2019_minq7', '')

fq = fastqq(files, k=5, labels)
cb= cbDistMatrix(fq)
hc= hclust(as.dist(cb))
plot(hc)
