rule bowtie2:
    input:
        sample="intermediates/{sample}_trimmed.fq.gz",
        whole_genome_fasta = "genome.fa", 
        bowtie2_idx = expand("genome{ref_ext}", ref_ext=BT2_EXT)
    output:
        temp("intermediates/{sample}.bam")
    log:
        "logs/bowtie2_{sample}.log"
    conda:
        "../envs/bowtie2_samtools_bcftools.yml"
    shell:
        "bowtie2 -p 2 --very-sensitive-local -U {input.sample} -x genome | samtools sort -o {output}"
