rule generate_targets_file:
    input:
        file="ref.vcf"
    output:
        "targets.tsv.gz"
    log:
        "logs/generate_targets.log"
    conda:
        "envs/bowtie2_samtools_bcftools.yml"
    shell:
        "bgzip {input.file} ; tabix -p vcf ref.vcf.gz ; "
        "bcftools query -f '%CHROM\t%POS\t%REF,%ALT\n' ref.vcf.gz |"
        "bgzip -c > targets.tsv.gz && tabix -s1 -b2 targets.tsv.gz ; "
        "gunzip ref.vcf.gz"
