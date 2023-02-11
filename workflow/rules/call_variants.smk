rule call_variants:
    input:
        mpileup="merged.mpileup",
        targets="targets.tsv.gz"
    output:
        temp("merged.vcf")
    log:
        "logs/call_variants.log"
    conda:
        "envs/bowtie2_samtools_bcftools.yml"
    shell:
        "bcftools call {input.mpileup} -v -f GQ -t {input.targets} -O v -m > {output}"
