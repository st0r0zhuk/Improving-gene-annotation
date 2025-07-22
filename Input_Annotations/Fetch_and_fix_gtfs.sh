#!/usr/bin/env bash
#
# =============================================================================
# Script Name:    fetch_and_fix_gtfs.sh
# Description:    Creates Conda/Mamba environments, downloads genome assemblies
#                 and annotation files and standardizes their GTF annotations using AGAT.
#
# Usage:
#   Make this script executable: chmod +x setup_and_prepare_references.sh
#   Run: ./setup_and_prepare_references.sh
#
# Prerequisites:
#   - Miniconda or Anaconda installed 
#   - `mamba` available in base environment


##################################################################################################################
##################################################################################################################

# conda env create --file ncbi_datasets.yaml
# mamba activate ncbi_datasets

########## rhesus macaque 10 - refseq  ########## 
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/annotation_releases/9544/103/GCF_003339765.1_Mmul_10/GCF_003339765.1_Mmul_10_genomic.fna.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/annotation_releases/9544/103/GCF_003339765.1_Mmul_10/GCF_003339765.1_Mmul_10_genomic.gff.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/annotation_releases/9544/103/GCF_003339765.1_Mmul_10/GCF_003339765.1_Mmul_10_genomic.gtf.gz


##########  CalJac: mCalJa1.2.  ########## 
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/011/100/555/GCF_011100555.1_mCalJa1.2.pat.X/GCF_011100555.1_mCalJa1.2.pat.X_genomic.gtf.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/011/100/555/GCF_011100555.1_mCalJa1.2.pat.X/GCF_011100555.1_mCalJa1.2.pat.X_genomic.fna.gz


##########  PanTro: NHGRI_mPanTro3-v2.1_pri (downloads as v2.0) : RefSeq Assembly  ########## 
datasets download genome accession GCF_028858775.2 --include gff3,rna,cds,protein,genome,seq-report
unzip ncbi_dataset.zip 

mv ncbi_dataset/data/GCF_028858775.2/GCF_028858775.2_NHGRI_mPanTro3-v2.0_pri_genomic.fna .GCF_028858775.2_NHGRI_mPanTro3-v2.0_pri_genomic.fna

#mv /work/vstorozhuk/data/reference/ncbi_dataset/data/GCF_028858775.2/genomic.gff /work/vstorozhuk/data/reference/GCF_028858775.2_NHGRI_mPanTro3-v2.0_pri_genomic.gff
# https://ftp.ncbi.nlm.nih.gov/genomes/all/annotation_releases/9598/GCF_028858775.2-RS_2024_02/
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/annotation_releases/9598/GCF_028858775.2-RS_2024_02/GCF_028858775.2_NHGRI_mPanTro3-v2.0_pri_genomic.gtf.gz
gunzip GCF_028858775.2-RS_2024_02/GCF_028858775.2_NHGRI_mPanTro3-v2.0_pri_genomic.gtf.gz


##########  Human  ########## 

wget https://ftp.ensembl.org/pub/release-114/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna_sm.toplevel.fa.gz
gunzip Homo_sapiens.GRCh38.dna_sm.toplevel.fa.gz

wget https://ftp.ensembl.org/pub/release-114/gtf/homo_sapiens/Homo_sapiens.GRCh38.114.gtf.gz
gunzip Homo_sapiens.GRCh38.114.gtf.gz

##################################################################################################################
##################################################################################################################

# conda env create --file agat_env.yaml
# mamba activate agat_env

agat_convert_sp_gff2gtf.pl \
  --in GCF_011100555.1_mCalJa1.2.pat.X_genomic.gtf \
  --gtf_version 3 \
  -o GCF_011100555.1_mCalJa1.2.pat.X_genomic.standardized.gtf

#########################################################

agat_convert_sp_gff2gtf.pl \
  --in GCF_003339765.1_Mmul_10_genomic.gtf \
  --gtf_version 3 \
  -o GCF_003339765.1_Mmul_10_genomic_standardized.gtf
  
#########################################################  
  
# must run
agat_convert_sp_gff2gtf.pl \
  --in GCF_028858775.2_NHGRI_mPanTro3-v2.0_pri_genomic.gtf \
  --gtf_version 3 \
  -o GCF_028858775.2_NHGRI_mPanTro3-v2.0_pri_genomic_standardized.gtf
  
  