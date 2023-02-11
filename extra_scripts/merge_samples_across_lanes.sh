#!/bin/bash

for file in *.fastq.gz
do
	sample_name=$(echo "$file" | awk -F_ '{print $1 "_" $2 "_" $3 "_" $4}')

	echo $sample_name

	cat "$file" >> "$sample_name"_R1.fastq.gz
done
