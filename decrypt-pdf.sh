#!/bin/bash

if [[ $# == 1 ]]; then
	input_dir=$1
else
	echo "Usage: $0 {input_dir}"
	exit 255
fi

output_dir="${input_dir}.decrypted"
mkdir -p $output_dir

function decrypt_one(){
	fn=$1
	input_dir=$2
	output_dir=$3
	echo "Unlocking '$fn'"
	qpdf --decrypt "${input_dir}/$fn" "${output_dir}/$fn"
}

export -f decrypt_one
ls -1 $input_dir | xargs -IFN bash -c "decrypt_one 'FN' '$input_dir' '$output_dir'"

