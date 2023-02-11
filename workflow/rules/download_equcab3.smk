rule download_equcab3:
    output:
        "genome.fa",
    log:
        "logs/download_equcab3.log",
    shell:
        "wget http://ftp.ensembl.org/pub/release-107/fasta/equus_caballus/dna/Equus_caballus.EquCab3.0.dna.toplevel.fa.gz ; "
        "gunzip Equus_caballus.EquCab3.0.dna.toplevel.fa.gz ; mv Equus_caballus.EquCab3.0.dna.toplevel.fa genome.fa"
