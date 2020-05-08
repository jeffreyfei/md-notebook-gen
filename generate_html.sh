#!/bin/bash

set -e

usage() {
    echo "Usage: $0 -t [page_title] <input_path> <output_path>"
    echo ""
    echo "-m  -  Keep MD hyperlinks; off by default"
}

stylesheet=style.css
convert_links=1

while getopts ":t:h" arg; do
    case $arg in
        h)
            usage
            exit 0
            ;;
        t)
            title=$OPTARG
            ;;
        m)
            convert_links=0
            ;;
        \?) 
            usage
            exit 1
            ;;
    esac
done

shift $((OPTIND -1))

input=$1
output=$2

if [[ -z $input || ! -f $input ]]; then
    printf "Invalid input path: %s\n" $input
    usage
    exit 1
fi

if [[ -z $output ]]; then
    printf "Missing output path\n"
    usage
    exit 1
fi

precontent=html_head
postcontent=html_tail

md_path=$input
md_name=$(basename $md_path)
md_dir=$(dirname $md_path)

if [[ -z $title ]]; then
    title="${md_name%.*}"
fi

target_path=$output

# Inject head tags for target html
printf "$(cat $precontent)" $title > $target_path

# Call github markdown API to convert md content
curl https://api.github.com/markdown/raw -X "POST" -H "Content-Type: text/plain" -d "$(cat $md_path)" >> $target_path

# Inject foot tags for target html
printf "$(cat $postcontent)" "$(cat $stylesheet)" >> $target_path

if [[ $convert_links ]]; then
    # Convert nested MD links to HTML links
    content=$(cat $target_path)
    echo "$content" | sed -e 's/\(<a href=".*\).md\(">\)/\1.html\2/g' > $target_path
fi

printf "Output created at: %s\n" $target_path
