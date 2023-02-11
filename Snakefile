"""
Author: S. Gavriliuc
Affiliation: UCalgary Dept. of Veterinary Medicine
Aim: A simple Snakemake workflow to process target enrichment sequence data using Allegro Targeted Genotyping
Date: Aug 2022
Updates:
    - Jan 2023: added option to pick between EquCab2 or EquCab3 reference genome
Run: snakemake -c1 --use-conda 
"""     


configfile: "config.yml"


# pull in all files with .fastq on the end into a list
FILES = glob_wildcards("seqs/{sample}.fastq.gz")
SAMPLES = FILES.sample

# file extensions needed for reference genome + index files
BT2_EXT = [".1.bt2", ".2.bt2", ".3.bt2", ".4.bt2", ".rev.1.bt2", ".rev.2.bt2"]

rule all:
    input:
        expand("seqs/{sample}.fastq.gz", sample=SAMPLES),
        "genome.fa", 
	expand("genome{ref_ext}", ref_ext=BT2_EXT),
        expand("intermediates/{sample}_trimmed.fq.gz", sample=SAMPLES),
        expand("intermediates/{sample}.fastq.gz_trimming_report.txt", sample=SAMPLES),
        expand("intermediates/{sample}.bam", sample=SAMPLES),
        expand("intermediates/{sample}_rg.bam", sample=SAMPLES),
        #"targets.tsv",
        "merged.bam",
        "merged.mpileup",
        "merged.vcf",
        "merged.filt.vcf"

include: "rules/download_ref_genome.smk"
include: "rules/index_equcab.smk"
include: "rules/trim_galore_se.smk"
include: "rules/bowtie2.smk"
include: "rules/add_read_groups.smk"
include: "rules/index_bam.smk"
include: "rules/merge_bams.smk"
include: "rules/mpileup.smk"
include: "rules/call_variants.smk"
include: "rules/filter_variants.smk"
