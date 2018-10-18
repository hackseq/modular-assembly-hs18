# Assemble genome sequencing reads using Unicycler and Flowcraft.

.DELETE_ON_ERROR:
.SECONDARY:

# Referene genome
ref=shigella_sonnei.abe

# Which container enginer to use.
profile=standard # Singularity
#profile=docker

# Fix needed for macOS.
# docker: Error response from daemon: Mounts denied:
# The path /var/folders/...
# is not shared from OS X and is not known to Docker.
#TMPDIR=/tmp

all: unicycler

unicycler: unicycler.fasta unicycler.gfa.png unicycler.quast.tsv

clean:
	rm -f .forkTree.json .metadata.json .treeDag.json .nextflow.log* pipeline_stats.txt*
	rm -rf .nextflow pipeline_status reports results work

# Download the reference genome.
# See https://www.ncbi.nlm.nih.gov/genome/417
shigella_sonnei.fa:
	curl ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/283/715/GCF_000283715.1_ASM28371v1/GCF_000283715.1_ASM28371v1_genomic.fna.gz | seqtk seq >$@

# Extract the A, B, and E plasmids.
shigella_sonnei.abe.fa: shigella_sonnei.fa
	samtools faidx $< NC_016833.1 NC_016823.1 NC_016834.1 | seqtk seq >$@

# Download the sequencing data.
# See https://github.com/rrwick/Unicycler/tree/master/sample_data#shigella-sonnei-plasmids-synthetic-reads
sample_%.fq.gz:
	curl -L -o $@ https://github.com/rrwick/Unicycler/raw/master/sample_data/short_reads_$*.fastq.gz

# Run Flowcraft.
unicycler.nf:
	flowcraft-dev build --merge-params -t 'unicycler (bandage | quast)' -o $@

# Run Nextflow.
unicycler.nf.stamp: unicycler.nf sample_1.fq.gz sample_2.fq.gz $(ref).fa
	nextflow run $< -resume --fastq='sample_{1,2}.fq.gz' --reference=$(ref).fa -profile $(profile)
	touch $@

# Copy the FASTA genome assembly.
unicycler.fasta: unicycler.nf.stamp
	cp results/assembly/unicycler_1_1/assembly.fasta $@

# Copy the GFA genome assembly graph.
unicycler.gfa: unicycler.nf.stamp
	cp results/assembly/unicycler_1_1/assembly.gfa $@

# Copy the Bandage plot.
unicycler.gfa.png: unicycler.nf.stamp
	cp reports/assembly/bandage_2_2/sample/assembly.gfa.ref.png $@

# Copy the QUAST report.
unicycler.quast.tsv: unicycler.nf.stamp
	cp results/assembly/quast_3_3/sample/transposed_report.tsv $@
