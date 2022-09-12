
rule mpileup:
    input:
        "merged.bam",
        reference="genome.fa"
    output:
        temp("merged.mpileup")
    params:
        t="--targets-file targets.tsv" if config["targets_file"] else []
    log:
        "logs/mpileup.log"
    conda:
        "../envs/bowtie2_samtools_bcftools.yml"
    shell:
        " bcftools mpileup -d1000000 --skip-indels -Ov merged.bam "
        "--fasta-ref {input.reference} -a FORMAT/DP "
        "{params.t} -o merged.mpileup "
