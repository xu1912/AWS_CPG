#!/bin/bash
chr=$1
file="hg19/hg19_chr"$chr"_cpg.snp"
mysql -uXXX -pXXX -e"use XXX;\
        drop table if exists cpg_snp_chr$chr;\
        CREATE TABLE cpg_snp_chr$chr (\
        chr CHAR(2) NULL DEFAULT NULL,\
        pos INT(10) UNSIGNED NULL DEFAULT NULL,\
        rs_id VARCHAR(50) NULL DEFAULT NULL,\
        ref_allel CHAR(1) NULL DEFAULT NULL,\
        alt_allel CHAR(1) NULL DEFAULT NULL,\
        quality_score CHAR(1) NULL DEFAULT NULL,\
        filter CHAR(1) NULL DEFAULT NULL,\
        info VARCHAR(500) NULL DEFAULT NULL,\
        type VARCHAR(50) NULL DEFAULT NULL,\
        INDEX snp_pos_chr$chr (pos));\
        load data local infile '$file' into table cpg_snp_chr$chr;\
        alter table cpg_snp_chr$chr add column (annot_ConservedTFBS varchar(16), annot_CpgIslands varchar(16), \
                annot_DNaseCluster varchar(16), annot_RepeatMasker varchar(16), annot_SuperEnhancerBySEA varchar(16), \
                annot_VistaEnhancers varchar(16));\
        update cpg_snp_chr$chr a, annot_ConservedTFBS b set a.annot_ConservedTFBS=b.row_id where b.chrom='chr$chr' and a.pos>=b.chromStart and a.pos<=b.chromEnd;\
        update cpg_snp_chr$chr a, annot_DNaseCluster b set a.annot_DNaseCluster=b.row_id where b.chrom='chr$chr' and a.pos>=b.chromStart and a.pos<=b.chromEnd;\
        update cpg_snp_chr$chr a, annot_CpgIslands b set a.annot_CpgIslands=b.row_id where b.chrom='chr$chr' and a.pos>=b.chromStart and a.pos<=b.chromEnd;\
        update cpg_snp_chr$chr a, annot_RepeatMasker b set a.annot_RepeatMasker=b.row_id where b.chrom='chr$chr' and a.pos>=b.chromStart and a.pos<=b.chromEnd;\
        update cpg_snp_chr$chr a, annot_SuperEnhancerBySEA b set a.annot_SuperEnhancerBySEA=b.row_id where b.chrom='chr$chr' and a.pos>=b.chromStart and a.pos<=b.chromEnd;\
        update cpg_snp_chr$chr a, annot_VistaEnhancers b set a.annot_VistaEnhancers=b.row_id where b.chrom='chr$chr' and a.pos>=b.chromStart and a.pos<=b.chromEnd;"
