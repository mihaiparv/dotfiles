#!/usr/bin/env bash
#
# Script to backup user preferences from ~/Library/Preferences.

usage="
NAME
    backup-pref -- backup user preference

SYNOPSIS
    backup-pref -h
    backup-pref -f <format> file1 [file2] ...

DESCRIPTION
    Backs-up user preferences in XML format. If the original format is binary then 
    the preferences are converted to XML format.
where:
    -h  show this help text
    -f  is the original format of the preferences.
        Can be one of: xml1 binary1 json
"
cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

format=''
source_file=''
destination_folder=''

while getopts ":hf:" opt ; do
  case "$opt" in
  h)
    echo "$usage"
    exit 0
    ;;
  f)  format=$OPTARG
    ;;
  esac
done
shift $((OPTIND-1))

if [[ -z "$format" ]] ; then
  echo "Format is not specified, to see usage instructions run '$(basename "$0") -h'."
  exit 1
elif [[ ! $format =~ ^xml1|binary1|json$ ]] ; then
  echo "Invalid format specified, use xml1, binary1 or json."
  exit 1
fi

while [ $# -gt 0 ] ; do
  source_file=$1

  if [[ $format =~ ^xml1|json$ ]] ; then
    destination_folder="symlink"
  else
    destination_folder="transform"
  fi

  plutil -convert xml1 $source_file -o $DOTFILES_ROOT/preferences/$destination_folder/${source_file##*/}

  # shift for next source file
  shift
done
