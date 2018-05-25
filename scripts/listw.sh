#!/bin/bash

my_dir="/home/jo/scripts"
source "$my_dir/bash_helper.sh"

filename=~/Zeiterfassung/current.csv
DATE_WITH_TIME=`date -Im`
if [ "$1" != '' ]; then
  WEEK=$1
else
  WEEK=`date +%V`
fi
jobname=''
starttime=''
endtime=''
endofweek=''
jobs=('lokpit' 'hvle  ')
echo "WEEK $WEEK"
echo '+--------+-------+-------+-------+-------+-------+-------+-------+-------+'
echo '| Job    | Mo    | Di    | Mi    | Do    | Fr    | Sa    | So    | Ges   |'
echo '+--------+-------+-------+-------+-------+-------+-------+-------+-------+'
for i in "${jobs[@]}"
do
  echo -n "| $i | "
  currentweekges=0
  currentday=1
  currentwork=0
  printed_day=''
  while IFS= read -r line; do
    if [ "$line" != "" ]; then

      # read lines in variables
      starttime=$jobname
      jobname=$endtime
      endtime=$line

      start_t=`date -d $starttime +%s 2>/dev/null`
      end_t=`date -d $endtime +%s 2>/dev/null`
      read_week=`date -d $starttime +%V 2>/dev/null`
      check=0
      if [ "$start_t" = '' ]; then
	check=1
      fi
      if [ "$end_t" = '' ]; then
	check=1
      fi
      if [ "$jobname" != "working for $i" ]; then
	check=1
      fi
      if [ "$check" = "0" ]; then
        check=`expr $WEEK - $read_week`
      fi
      if [ "$check" = "0" ]; then
        dayofweek=`date -d $starttime +'%u'`
        work_t=`expr $end_t - $start_t`
	work_t=`pause_subtraction $work_t`
        
#        echo "$dayofweek - $currentday - $currentwork"
	while [ "$dayofweek" != "$currentday" ]; do
	  print_current_work $currentwork
          currentwork="0"
	  printed_day=$currentday
	  if [ "$currentday" = "7" ]; then
            print_current_work $currentweekges 
	    currentday=0
	  fi
          currentday=`expr $currentday + 1`
        done
	currentwork=`expr $currentwork + $work_t`
        currentweekges=`expr $currentweekges + $work_t`

      fi
    fi
  done < <(grep "" $filename)
  while [ "$printed_day" != "7" ]; do
    print_current_work $currentwork
    currentwork="0"
    printed_day=$currentday
    currentday=`expr $currentday + 1`
  done
  print_current_work $currentweekges
  
  echo ''
  echo '+--------+-------+-------+-------+-------+-------+-------+-------+-------+'
done

