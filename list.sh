#!/usr/bin/env bash
count_article=1
for file in articles/*.md; do
	# while read line; do
	number_line=1
	while IFS= read -r line; do
		if [ $number_line = 1 ]; then
			name_article="${line:2}";
			# echo $file
			file_name=$(echo $file | sed -E "s/.*\/([^/]+\.md)$/\1/")
			ee="$count_article. ($file_name) $name_article"
			echo $ee
		fi
		count_article=$(($count_article + 1))
		break
	done <$file
done
