snakemake --rulegraph | grep -v "> 0"  | grep -v 'label = "all"' | dot -Tpng -o allegro.png
