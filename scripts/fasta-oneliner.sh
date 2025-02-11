#!/bin/bash

# This script takes one Fasta file as a commandline argument.
# It transforms the sequence data so that in the output, each
# sequence is on one (long) line only.

# testing that we have exactly one commandline argument
if [ $# -ne 1 ]
then
	echo "Usage: $0 <fasta_file>" >/dev/stderr
	exit 14
fi

# checking that the argument #1 corresponds to an existing file
if [ ! -e $1 ]
then
	echo "Unable to find the file $1" >/dev/stderr
	exit 13
fi


# The following is a while loop fed from a file,
# meaning it receives the contents of the file as its standard input.
# The said file is the one given as the first commandline argument.
while read myline 
do
	# complex solution to extract the first character,
	# involving a call to echo and a call to grep:
	# first_char=$( echo ${myline} | grep -o '^.' )

	# simpler version:
	first_char=${myline:0:1} # extracting 1 char from position 0

	# echo "line: ${myline}" 
	# echo "1st char: ${first_char}" 

	if [ "${first_char}" = ">" ]
	then
		# if the buffer is not empty, then
		# we write out the buffer of the previous sequence
		if [ ${#buffer} -gt 0 ]; then echo "${buffer}"; fi 
		# we clear the buffer
		buffer=""
		# we echo the current identifier line
		echo "${myline}"
	else
		# my line is not a line of identifier,
		# but a line of sequence data
		buffer="${buffer}${myline}" # appending the content of myline to the current
		# content of the buffer

	fi	

done                      <$1  # this indirection uses the input file as standard input
                               # to the while loop

echo "${buffer}" # the last sequence
