CREATE TABLE `cpg_snp_chr21` (
	chr CHAR(2) NULL DEFAULT NULL,
	`pos` INT(10) UNSIGNED NULL DEFAULT NULL,
	`rs_id` VARCHAR(50) NULL DEFAULT NULL,
	`ref_allel` CHAR(1) NULL DEFAULT NULL,
	`alt_allel` CHAR(1) NULL DEFAULT NULL,
	`quality_score` CHAR(1) NULL DEFAULT NULL,
	`filter` CHAR(1) NULL DEFAULT NULL,
	`info` VARCHAR(500) NULL DEFAULT NULL,
	`type` VARCHAR(50) NULL DEFAULT NULL
	INDEX `snp_pos_chr21` (`pos`)
)

load data local infile "hg19_chr21_cpg.snp" into table cpg_snp_chr21;

alter table cpg_snp_chr21 add column (annot_ConservedTFBS varchar(16), annot_CpgIslands varchar(16), annot_DNaseCluster varchar(16),
													annot_RepeatMasker varchar(16), annot_SuperEnhancerBySEA varchar(16), annot_VistaEnhancers varchar(16));
													
update cpg_snp_chr21 a, annot_ConservedTFBS b set a.annot_ConservedTFBS=b.row_id where b.chrom="chr21" and a.pos>=b.chromStart and a.pos<=b.chromEnd;
update cpg_snp_chr21 a, annot_DNaseCluster b set a.annot_DNaseCluster=b.row_id where b.chrom="chr21" and a.pos>=b.chromStart and a.pos<=b.chromEnd;
update cpg_snp_chr21 a, annot_CpgIslands b set a.annot_CpgIslands=b.row_id where b.chrom="chr21" and a.pos>=b.chromStart and a.pos<=b.chromEnd;
update cpg_snp_chr21 a, annot_RepeatMasker b set a.annot_RepeatMasker=b.row_id where b.chrom="chr21" and a.pos>=b.chromStart and a.pos<=b.chromEnd;
update cpg_snp_chr21 a, annot_SuperEnhancerBySEA b set a.annot_SuperEnhancerBySEA=b.row_id where b.chrom="chr21" and a.pos>=b.chromStart and a.pos<=b.chromEnd;
update cpg_snp_chr21 a, annot_VistaEnhancers b set a.annot_VistaEnhancers=b.row_id where b.chrom="chr21" and a.pos>=b.chromStart and a.pos<=b.chromEnd;
