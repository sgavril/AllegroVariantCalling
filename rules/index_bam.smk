rule index_bam:
    input:
        sample="intermediates/{sample}_rg.bam"
    output:
        temp("intermediates/{sample}_rg.bam")
    log:
        "logs/index_bam_{sample}.log"
    conda:
        "../envs/bowtie2_samtools.yml"
    shell:
        "samtools index samtools {output}"
