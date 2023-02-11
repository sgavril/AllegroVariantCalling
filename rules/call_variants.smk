rule call_variants:
    input:
        mpileup="merged.mpileup"
    output:
        "merged.vcf"
    params:
        t="-t targets.tsv" if config["targets_file"] else []
    log:
        "logs/call_variants.log"
    conda:
        "../envs/bowtie2_samtools_bcftools.yml"
    shell:
        "bcftools call {input.mpileup} -v -f GQ {params.t} -O v -m > {output}"
