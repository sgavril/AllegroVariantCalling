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
        "genome.fa", expand("genome{ref_ext}", ref_ext=BT2_EXT),
        expand("intermediates/{sample}_trimmed.fq.gz", sample=SAMPLES),
        expand("intermediates/{sample}.fastq.gz_trimming_report.txt", sample=SAMPLES),
        expand("intermediates/{sample}.bam", sample=SAMPLES),
        expand("intermediates/{sample}_rg.bam", sample=SAMPLES),
        #"targets.tsv",
        "merged.bam", "merged.mpileup",
        "merged.vcf", "merged.filt.vcf",
	"merged.depths.table", "merged.genotypes.table"

include: "rules/0_download_ref_genome.smk"
include: "rules/1_index_equcab.smk"
include: "rules/2_trim_galore_se.smk"
include: "rules/3_bowtie2.smk"
include: "rules/4_add_read_groups.smk"
include: "rules/5_index_bam.smk"
include: "rules/6_merge_bams.smk"
include: "rules/7_mpileup.smk"
include: "rules/8_call_variants.smk"
include: "rules/9_filter_variants.smk"
include: "rules/10_variants_to_table.smk"
