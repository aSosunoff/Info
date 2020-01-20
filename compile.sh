#!/usr/bin/env bash

path='articles'
exclude_files=('bottom_article')

function getFileName {
	# file_name=$(echo $file | sed -E "s/.*\/([^/]+)\.md$/\1/")
	if [ ! -n "$1" ]; then
		echo ''
		exit
	fi

	path=$1
	
	local file_name=${path##*/}
	local file=${file_name%.*}

	echo $file;
}

function can_exclude {
	if [ ! -n "$1" ]; then
		echo true
		exit
	fi
	
	file_name=$1

	for ((i = 0; i < ${#exclude_files[*]}; i++)); do
		if [[ $file_name =~ ^${exclude_files[$i]}$ ]]; then
			can_exclude=true
		fi
	done
}


for file in $path/*.md; do
	# while read line; do
	file_name=$(getFileName $file)

	if $(can_exclude $file_name); then
		continue
	fi
	
	number_line=1
	echo '<details>'
	IFS=$'\n'
	for line in $(cat $file); do
		if [ $number_line = 1 ]; then
			echo "	<summary>${line:2:-1}</summary>"
		else
			echo $line
		fi

		number_line=$(($number_line + 1))
	done
	echo '</details>'

	# :TODO NOT READ LAST LINE
	# while IFS= read -r line; do
	# 	if [ $number_line = 1 ]; then
	# 		echo "	<summary>"
	# 		echo "	${line:2}"
	# 		echo "	</summary>"
	# 	else
	# 		echo $line
	# 	fi

	# 	number_line=$(($number_line + 1))
	# done <$file
done >README.md

for ((i = 0; i < ${#exclude_files[*]}; i++)); do
	exclude_file=$path/${exclude_files[$i]}.md
	
	echo " " >>README.md
	
	IFS=$'\n'
	for line in $(cat $exclude_file); do
		echo $line
	done

    # printf "   %s\n" $file
done >>README.md