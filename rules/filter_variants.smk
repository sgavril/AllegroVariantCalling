rule filter_variants:
    input:
        variants="merged.vcf"
    output:
        filt="merged.filt.vcf"
    log:
        "logs/filter_variants.log"
    params:
        gq_score = config["filter_variants"]
    conda:
        "../envs/bowtie2_samtools_bcftools.yml"
    shell:
        "bcftools filter -S . -e '{params.gq_score}' {input} -o {output}"
