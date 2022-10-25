#!/usr/bin/env bash

#set -x

options=($(ls | rg -v "\."))

function list_options() {
	printf "Available options:\n"
	for i in "${options[@]}"; do
		printf "\t- %s\n" $i
	done
}

if [[ -z $1 ]]; then
	printf "./install.sh [folder]\n"
	list_options
	exit 1
elif [[ ! " ${options[*]} " =~ " ${1} " ]]; then
	printf "%s is not a valid option\n" $1
	list_options
	exit 2
else 
	stow -t ~/ -d "$1" $(ls $1)
fi

