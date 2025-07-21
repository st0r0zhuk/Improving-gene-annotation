
Folder contains inter files to reproduce generation of chains and do liftover of CAGE Peaks from RheMac8
Chain generation is done with https://github.com/wurmlab/flo as follows:
1. install all needed kent toolkit functions to conda flo_env
2. input fasta files are defined in yaml file
3. yaml has to have specific name - "flo_opts.yaml" to be selected for run
4. To run give location of where the rakefile from flo is installed e.g. rake -f /work/vstorozhuk/other/flo/Rakefile

Important! Final chain is not recognized by rtracklayer import.chain, but it is valid and can be used via UCSC liftOver in terminal

Macaca CAGE peaks are then lifted over as follows:
Script for this is LiftOver_Cage.Rmd
  RheMac8 -> RheMac10_RefSeq 
  RheMac8 -> RheMac10 *-> CalJac4 -> CalJac1.2
  RheMac8 -> RheMac10 *-> PanTro6 -> mPanTro3
  
  
  
  
# Used fasta files for chains #

# RheMac8 to MMul10 RefSeq names
wget https://hgdownload.soe.ucsc.edu/goldenPath/rheMac8/bigZips/rheMac8.fa.gz 
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/annotation_releases/9544/103/GCF_003339765.1_Mmul_10/GCF_003339765.1_Mmul_10_genomic.fna.gz

# PanTro6 to NHGRI_mPanTro3-v2.1_pri
wget https://hgdownload.soe.ucsc.edu/goldenPath/panTro6/bigZips/panTro6.fa.gz
datasets download genome accession GCF_028858775.2 --include gff3,rna,cds,protein,genome,seq-report
unzip ncbi_dataset.zip 
mv ncbi_dataset/data/GCF_028858775.2/GCF_028858775.2_NHGRI_mPanTro3-v2.0_pri_genomic.fna ./GCF_028858775.2_NHGRI_mPanTro3-v2.0_pri_genomic.fna

# CalJac4 to GCF_011100555.1_mCalJa1.2.pat.X
wget https://hgdownload.soe.ucsc.edu/goldenPath/calJac4/bigZips/calJac4.fa.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/011/100/555/GCF_011100555.1_mCalJa1.2.pat.X/GCF_011100555.1_mCalJa1.2.pat.X_genomic.fna.gz
