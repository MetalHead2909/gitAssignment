#!/bin/bash

query_file_protein=$1
subject_file_nucleotide=$2
output_file=$3

tblastn -query $query_file_protein -subject $subject_file_nucleotide -task tblastn -outfmt '6 pident length qlen' -out $output_file

awk -F'\t' '{if (($1>30) && ((($2)/($3))>0.9)) print $1, $2, $3}' $output_file | wc -l | awk '{print $1}'

