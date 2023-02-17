rule variants_to_table:
	input:
		filt="merged.filt.vcf"
	output:
		depths="merged.depths.table",
		genotypes="merged.genotypes.table"
	log:
		"logs/gatk_variants_to_table.log"
	conda:
		"../envs/gatk.yml"
	shell:
		"gatk VariantsToTable -V {input} -F CHROM -F POS -F REF -F ALT -GF DP -O {output.depths} && \
		gatk VariantsToTable -V {input} -F CHROM -F POS -F REF -F ALOT -GF GT -O {output.genotypes}"
