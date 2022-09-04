rule add_read_groups:
    input:
        sample="intermediates/{sample}.bam"
    output:
        temp("intermediates/{sample}_rg.bam")
    log:
        "logs/add_read_groups_{sample}.log"
    conda:
        "envs/gatk.yml"
    shell:
        "gatk AddOrReplaceReadGroups I={input.sample} O={output} RGID=1 RGLB=lib1 RGPL=nugen RGPU=unit1 RGSM={input.sample}"
