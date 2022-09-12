rule trim_galore_se:
    input:
        sample="seqs/{sample}.fastq.gz"
    output:
        temp("intermediates/{sample}_trimmed.fq.gz"),
        temp("intermediates/{sample}.fastq.gz_trimming_report.txt")
    params:
        length = config["trim_galore_length"],
        stringency = config["trim_galore_stringency"],
        clip_R1 = config["trim_galore_clip_r1"]
    log:
        "logs/trim_galore_{sample}.log",
    conda:
        "../envs/trim_galore.yml"
    shell:
        "trim_galore --length {params.length} --stringency {params.stringency} --clip_R1 {params.clip_R1} {input.sample} -o intermediates"
