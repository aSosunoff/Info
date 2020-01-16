#!/usr/bin/env bash

for file in articles/*.md; do
	# while read line; do
	number_line=1
	echo '<details>'
	IFS=$'\n'
	for line in $(cat $file); do
		if [ $number_line = 1 ]; then
			echo "	<summary>"
			echo "	${line:2}"
			echo "	</summary>"
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
