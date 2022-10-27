#!/usr/bin/env bash


#### Template Begin
# Slightly adapted from: https://sharats.me/posts/shell-script-best-practices/

# exit if a command fails
set -o errexit

# fail when setting an unset variable
# to access variables not set yet use "${VARNAME-}"
set -o nounset

# treat pipe as failed even if one command fails
set -o pipefail

# enable debug mode when script is ran like 
# `TRACE=1 ./install.sh [folder]`
if [[ -n "${TRACE-}" ]]; then
	set -o xtrace
fi

# Change to directory the script is located in when ran
cd "$(dirname "$0")"

#### Template End


# original code: options=($(ls | rg -v "\."))
mapfile -t options <  <(ls | rg -v "\.")

function list_options() {
	printf "Available options:\n"
	for i in "${options[@]}"; do
		printf "\t- %s\n" "$i"
	done
}

if [[ -z "${1-}" ]]; then
	printf "./install.sh [folder]\n"
	list_options
	exit 1
elif [[ ! " ${options[*]} " =~ " ${1} " ]]; then
	printf "%s is not a valid option\n" "$1"
	list_options
	exit 2
else 
	stow -t ~/ -d "$1" $(ls "$1")
fi

