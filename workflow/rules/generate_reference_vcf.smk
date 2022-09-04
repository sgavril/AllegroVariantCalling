rule generate_reference_vcf:
    input:
        plink_file = config["plink_ped_map_prefix"]
    output:
        "ref.vcf"
    log:
        "logs/generate_reference_vcf"
    conda:
        "envs/plink.yml"
    shell:
        "plink --file "
