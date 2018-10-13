# Assemble genome sequencing reads using SPAdes and Flowcraft.

.DELETE_ON_ERROR:
.SECONDARY:

# Referene genome
ref=shigella_sonnei

# Which container enginer to use.
profile=standard # Singularity
#profile=docker

# Fix needed for macOS.
# docker: Error response from daemon: Mounts denied:
# The path /var/folders/...
# is not shared from OS X and is not known to Docker.
#TMPDIR=/tmp

all: spades

spades: spades.fasta spades.gfa.png spades.quast.tsv

clean:
	rm -f .forkTree.json .metadata.json .treeDag.json .nextflow.log* pipeline_stats.txt*
	rm -rf .nextflow pipeline_status reports results work

# Download the reference genome.
# See https://www.ncbi.nlm.nih.gov/genome/417
shigella_sonnei.fa:
	curl ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/283/715/GCF_000283715.1_ASM28371v1/GCF_000283715.1_ASM28371v1_genomic.fna.gz | seqtk seq >$@

# Download the sequencing data.
sample_%.fq.gz:
	curl -L -o $@ https://github.com/rrwick/Unicycler/raw/master/sample_data/short_reads_$*.fastq.gz

# Run Flowcraft.
spades.nf:
	flowcraft build -t 'spades quast' -o $@

# Run Nextflow.
spades.nf.stamp: spades.nf sample_1.fq.gz sample_2.fq.gz
	nextflow run $< -resume --fastq='sample_{1,2}.fq.gz' --reference_1_3=shigella_sonnei.fa -profile $(profile)
	touch $@

# Copy the FASTA genome assembly.
spades.fasta: spades.nf.stamp
	cp results/assembly/spades_1_2/sample_spades3120.fasta $@

# Copy the GFA genome assembly graph.
spades.gfa: spades.nf.stamp
	cp results/assembly/spades_1_2/sample/assembly_graph_with_scaffolds.gfa $@

# Copy the QUAST report.
spades.quast.tsv: spades.nf.stamp
	cp results/assembly/quast_1_3/sample/transposed_report.tsv $@

# Render the GFA file to PNG using Bandage.
%.gfa.png: %.gfa $(ref).fa
	Bandage image $< $@ --query $(ref).fa

# Render the GFA file to SVG using Bandage.
%.gfa.svg: %.gfa $(ref).fa
	Bandage image $< $@ --query $(ref).fa
