### Folder caontains steps to re-generate chains for liftover ###

Chain generation is done with https://github.com/wurmlab/flo 

Steps to make the chains:

1. Follow git instructions of flow to setup flo (clone / recreate via flo_env.yaml)
2. Params and input fasta (source and target) files to be used during a run are defined in yaml files
3. To run give location of where the rakefile from flo is installed e.g. rake -f /work/vstorozhuk/other/flo/Rakefile while being in the folder with the yaml (rename to flo_options.yaml)

Final chain is not recognized by rtracklayer::import.chain, but it is valid and can be used via UCSC liftOver in terminal
