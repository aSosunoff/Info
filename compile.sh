#!/usr/bin/env bash

path='articles'
exclude_files=('bottom_article')

for file in $path/*.md; do
	# while read line; do
	file_name=$(echo $file | sed -E "s/.*\/([^/]+)\.md$/\1/")
	
	can_exclude=false
	for ((i = 0; i < ${#exclude_files[*]}; i++)); do
		if [[ $file_name =~ ^${exclude_files[$i]}$ ]]; then
			can_exclude=true
		fi
	done
	if $can_exclude; then
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

	echo '</details>'
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