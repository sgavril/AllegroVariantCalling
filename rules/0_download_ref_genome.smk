rule download_ref_genome:
    output:
        "genome.fa"
    log:
        "logs/download_ref_genome.log",
    run:
        if config["equcab_ref_genome"] == 2:
            shell("wget https://hgdownload.soe.ucsc.edu/goldenPath/equCab2/bigZips/equCab2.fa.gz -O genome.fa.gz")
        elif config["equcab_ref_genome"] == 3:
            shell("wget http://ftp.ensembl.org/pub/release-107/fasta/equus_caballus/dna/Equus_caballus.EquCab3.0.dna.toplevel.fa.gz -O genome.fa.gz")
        shell("gunzip genome.fa.gz")
