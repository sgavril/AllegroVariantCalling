rule merge_bams:
    input: 
        bams = expand("intermediates/{sample}_rg.bam", sample=SAMPLES)
    output:
        "merged.bam"
    log:
        "logs/merge_bam.log"
    conda:
        "../envs/bowtie2_samtools_bcftools.yml"
    shell:
        "samtools merge {output} {input.bams}"
