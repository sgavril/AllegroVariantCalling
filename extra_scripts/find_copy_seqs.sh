#!/bin/bash
#SBATCH --job-name=cp_allegro
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=4gb
#SBATCH --time=1:00:00
#SBATCH --output=cp_%j.log

find /home/stefan.gavriliuc/SI-Allegro-1 -type f -name "*.fastq.gz" -exec cp {} /scratch/${SLURM_JOB_ID}\ ;
