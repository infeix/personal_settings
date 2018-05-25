#!/bin/bash

my_dir="/home/jo/scripts"
source "$my_dir/bash_helper.sh"

filename=~/Zeiterfassung/current.csv
DATE_WITH_TIME=`date -Im`
prelastline=''
lastline=''
while IFS= read -r line; do
  if [ "$line" != "" ]; then
    prelastline=$lastline
    lastline=$line
  fi
  echo '.'
done < <(grep "" $filename)

clear
echo ""
if [ "$lastline" != "not working" ]; then
  start_t=`date -d $prelastline +%s`
  current_t=`date -d $DATE_WITH_TIME +%s`
  worktime=`date --date=@$(($current_t - $start_t)) +'%s'`
  # worktime=`pause_subtraction $worktime`
  worktimeh=`expr $worktime / 3600`
  worktimehm=`expr $worktimeh \* 3600`
  worktimerest=`expr $worktime - $worktimehm`
  worktimem=`expr $worktimerest / 60`
  echo "> How long you worked in MINUTES? [${worktimeh}h : ${worktimem}m]:"
  read userworktime

  if [ "$userworktime" != '' ]; then
    userworktime=`expr $userworktime \* 60`
  else
    userworktime=$worktime
  fi
  end_t=`date --date=@$(($start_t + $userworktime)) -Im`

  echo "" >> $filename  
  echo $end_t >> $filename
  echo "not working" >> $filename
  echo $end_t
  echo "STOP WORKING"
else
  echo "ALREADY NOT WORKING"
fi

