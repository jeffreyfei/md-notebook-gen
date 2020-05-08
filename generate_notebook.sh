#!/bin/bash

input_dir=$1
output_dir=output

if [[ -z $input_dir || ! -d $input_dir ]]; then
    echo "Invalid input directory: $input_dir"
fi

rm -rf $output_dir
mkdir -p $output_dir

for path in $(find $input_dir -type f -follow -print); do
    file=$(basename $path)
    ext="${file##*.}"

    if [[ $ext = "md" ]]; then
        dir=$(dirname $path)
        dest=$output_dir/${dir#$input_dir}
        mkdir -p $dest

        name="${file%.*}.html"

        ./convert_html.sh $path $dest/$name
    fi
done
