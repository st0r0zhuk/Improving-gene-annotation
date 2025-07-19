## Short-Read Data Preparation

`recreate_short_read_data_folder.sh` automates fetching public paired-end RNA-Seq data for three species (CalJac, PanTro, RheMac).  
It will:

1. Create one folder per species.  
2. Download and split each SRA accession into `_1.fastq`/`_2.fastq`.  
3. Generate a `<species>.fofn` file listing each R1/R2 pair (absolute paths).  

The resulting `.fofn` files can be passed directly to `sqanti3_qc --short_reads` 