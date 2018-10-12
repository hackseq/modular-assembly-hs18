.DELETE_ON_ERROR:
.SECONDARY:

# Which container enginer to use.
profile=standard # Singularity
#profile=docker

# Fix needed for macOS.
# docker: Error response from daemon: Mounts denied:
# The path /var/folders/...
# is not shared from OS X and is not known to Docker.
#TMPDIR=/tmp

all: spades

sample_%.fq.gz:
	curl -L -o $@ https://github.com/rrwick/Unicycler/raw/master/sample_data/short_reads_$*.fastq.gz

spades.nf:
	flowcraft build -t spades -o $@

spades: results/assembly/spades_1_2/sample_spades3120.fasta

results/assembly/spades_1_2/sample_spades3120.fasta: spades.nf sample_1.fq.gz sample_2.fq.gz
	nextflow run $< --fastq='sample_{1,2}.fq.gz' -profile $(profile)
