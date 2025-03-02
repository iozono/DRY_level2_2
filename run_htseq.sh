#!/bin/bash

# GTFファイルのパスを指定
GTF_FILE="./ref/Homo_sapiens.GRCh38.95.gtf"

# すべてのBAMファイルに対してHTSeqを実行
for bam in *Aligned.sortedByCoord.out.bam; do
    sample_name=$(basename "$bam" Aligned.sortedByCoord.out.bam)
    echo "Processing $bam..."
    htseq-count -f bam -r pos -s no -i gene_id "$bam" "$GTF_FILE" > "${sample_name}_counts.txt"
done

echo "HTSeq count completed for all samples."
