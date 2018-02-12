#!/bin/bash

if [[ $# == 1 ]]; then
	input_dir=$1
else
	echo "Usage: $0 {input_dir}"
	exit 255
fi

output_dir="${input_dir}.unlocked"
mkdir -p $output_dir

function unlock_one(){
	fn=$1
	input_dir=$2
	output_dir=$3
	echo "Unlocking '$fn'"
	qpdf --decrypt "${input_dir}/$fn" "${output_dir}/$fn"
}

export -f unlock_one
ls -1 $input_dir | xargs -IFN bash -c "unlock_one 'FN' '$input_dir' '$output_dir'"

