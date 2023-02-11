rule generate_equcab3_index:
    input:
        "genome.fa",
    output:
        expand("genome{ref_ext}", ref_ext=BT2_EXT)
    log:
        "logs/generate_equcab3_index.log"
    conda:
        "envs/bowtie2_samtools_bcftools.yml"
    shell:
        "bowtie2-build genome.fa genome"
