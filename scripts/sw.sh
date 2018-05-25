#!/bin/bash

my_dir="/home/jo/scripts"
source "$my_dir/bash_helper.sh"

filename=~/Zeiterfassung/current.csv
DATE_WITH_TIME=`date -Im`
current_t=`date -d $DATE_WITH_TIME +%s`
job_name=$1
offset="0"
if [ "$2" != "" ]; then
  if [ "$2" = "-" -a "$3" != "" ]; then
    offset=$3
    offset=`expr $offset \* 60`
    offset=`expr 0 - $offset`
  else
    offset=$2
  fi
fi

prelastline=''
lastline=''
while IFS= read -r line; do
  if [ "$line" != "" ]; then
    prelastline=$lastline
    lastline=$line
  fi
done < <(grep "" $filename)

echo ""
echo ""

if [ "$lastline" = "not working" ]; then
  echo "" >> $filename
  start_t=`date --date=@$(($current_t + $offset)) -Im`
  echo $start_t >> $filename
  job_name=`str_to_size "$job_name" 6`
  echo "working for $job_name" >> $filename
  echo "$start_t START WORKING"
else
  echo " !!! ALREADY WORKING !!! (need to end work with 'ew')"
fi
echo ""
echo ""

