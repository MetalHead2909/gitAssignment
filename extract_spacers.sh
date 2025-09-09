#!/bin/bash

if [ -z "$1" ]; then
	echo "Error: Please enter query file and subject file"
	exit 1
fi

if [ -z "$2" ]; then
        echo "Error: Please enter subject file"
	exit 1
fi

if [ -z "$3" ]; then
        echo "Error: Please enter output file"
	exit 1
fi

query_file="$1"
subject_file="$2"
output_file="$3"
#mock_output_file="preprocess.txt"
#count=0

output_filename="${output_file%.*}"
output_filename_ext="${output_file##*.}"

if [[ "$output_filename_ext == "fasta" ]]; then
	seqtk subseq $1 $2 > "$output_file"
else
	seqtk subseq $1 $2 > "$output_filename.$output_filename_ext"
fi

#blastn -query "${query_file}" -subject "${subject_file}" -task blastn-short -outfmt '6 std sseq' -perc_identity 100 -qcov_hsp_perc 100 -out "${output_file}"

#wc -l "${output_file}" | awk '{print $1}'

