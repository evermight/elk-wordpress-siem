#!/bin/bash
while getopts d: option
do
    case "${option}" in
        d) target_dir=${OPTARG};;
    esac
done

if [ -z $target_dir ]; then
  echo '-d required for directory to be scanned'
  exit
fi

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $script_dir

clamscan_log=$script_dir"/log/scan.log"
clamscan_quarantine=$script_dir"/q"

mkdir -p $(dirname $clamscan_log);
mkdir -p $clamscan_quarantine;

rm -rf $clamscan_log;

clamscan -r --log=$clamscan_log --move=$clamscan_quarantine $target_dir;
