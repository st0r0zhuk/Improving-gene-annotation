#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob

# Short-read data fetch & prep script
# Uses SRA Toolkit: prefetch + fasterq-dump
# Outputs paired FASTQ into species dirs and creates a .fofn per species

# Define SRA runs for each species
declare -A species_runs=(
  [CalJac]="SRR1758979 ERR3417915 ERR3417986 SRR1758977"
  [PanTro]="SRR1758917 SRR786425 SRR786426 SRR786427 SRR786428"
  [RheMac]="SRR786429 SRR786430 SRR786431 SRR786432 ERR3415756 SRR223518 SRR594455 ERR3418013 ERR3418016 ERR3418009 SRR594464"
)

for species in "${!species_runs[@]}"; do
  echo -e "\n=== Processing species: $species ==="

  # Create (or clear) species directory
  mkdir -p "$species"

  # Path to the FOFN file
  fofn_file="$species/${species}.fofn"
  > "$fofn_file"

  # Fetch and dump each run
  for run in ${species_runs[$species]}; do
    echo "-- Prefetching $run"
    prefetch "$run"

    echo "-- Dumping $run to FASTQ in $species/"
    fasterq-dump \
      --split-files \
      --outdir "$species" \
      "$run"
  done

  # Generate FOFN: list R1/R2 pairs on one line
  echo "-- Generating FOFN for $species"
  for fq1 in "$species"/*_1.fastq; do
    fq2="${fq1%_1.fastq}_2.fastq"
    if [[ -f "$fq2" ]]; then
      printf "%s %s\n" \
        "$(readlink -f "$fq1")" \
        "$(readlink -f "$fq2")" \
      >> "$fofn_file"
    fi
  done

  # Remove any empty or whitespace-only lines
  sed -i '/^[[:space:]]*$/d' "$fofn_file"

  # Strip the trailing newline so there's no blank final line
  if [[ -s "$fofn_file" ]]; then
    head -c -1 "$fofn_file" > "${fofn_file}.tmp" && mv "${fofn_file}.tmp" "$fofn_file"
  fi

  echo "FOFN created at $fofn_file"
done

echo -e "\nAll species processed! .fofn files ready"