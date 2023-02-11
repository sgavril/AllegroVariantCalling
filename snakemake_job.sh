#!/bin/bash
#SBATCH --job-name=allegro
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=32gb
#SBATCH --time=36:00:00
#SBATCH --output=allegro_%j.log
source activate snakemake
snakemake --cores 6 --use-conda  
