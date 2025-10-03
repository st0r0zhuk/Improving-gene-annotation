# Improving-gene-annotation-with-R2C2

![Visual Summary of the Project](Isoforms.png)

## Summary of scripts
- Script to fetch short‐read data into folder and create fofn for SQANTI3 RNA-Seq support [Script file](Short_Reads/recreate_short_read_data_folder.sh)
- Yamls to reproduce creating lift over chain files [Script folder](CAGE/)
- Script to do reciprocal lift over to get CAGE peaks for all species [Script file](CAGE/LiftOver_CAGE.Rmd)
- Snakemake files and config to run pipeline at different isoform support levels (s1,s2,s3) [Scripts folder](Snakemake_to_reconstruct_isoforms/)
- Scripts for explorative analysis of the discovered isoforms [Scripts file](Scripts_for_analysis_of_isoforms/plot_overall_isoform_statistics.Rmd)
- Scripts to add SQANTI3-filtered isoforms supported by at least 2 long reads from Mandalorion to the default gtf per species [Scripts folder](Scripts_for_merging_gtfs_and_qc/)




# Highlights of the project



## Read Processing is wrapped in Snakemake pipeline ## 


![](/Snakemake_to_reconstruct_isoforms/rulegraph.png)
