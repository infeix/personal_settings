#!/bin/bash

function str_to_size() {
  str_val=$1
  size_out=$2
  name_size=${#str_val}
  fill=`expr $size_out - $name_size`
  if [ $fill -lt 0 ]; then
    str_val=${str_val:0:$fill}
  fi
  while [ $fill -gt 0 ]; do
    str_val="${str_val} "
    fill=`expr $fill - 1`
  done
  echo "$str_val"
  return 0
}

function pause_subtraction() {
  seconds=$1
  if [ "$1" != '' -a "$1" != '0' ]; then
    if [ $1 -gt 21600 ]; then
      seconds=`expr $seconds - 1800`
    fi
    if [ $1 -gt 32400 ]; then
      seconds=`expr $seconds - 900`
    fi
  fi
  echo "$seconds"
  return 0
}

function calc_h() {
  if [ "$1" != '' -a "$1" != '0' ]; then
    seconds_h=`expr $1 / 3600`
  else
    seconds_h="0"
  fi
  ret_val=$seconds_h
  if [ $ret_val -lt 10 ]; then
    echo "0$ret_val"
  else
    echo "$ret_val"
  fi
  return 0
}

function calc_m() {
  seconds_m="0"
  if [ "$1" != '' -a "$1" != '0' ]; then
    seconds_m=`expr $1 / 60`
  else
    echo "0$seconds_m"
    return 0
  fi
  seconds_h=`calc_h $1`
  if [ "$seconds_h" != '0' ]; then
    seconds_hm=`expr $seconds_h \* 60`
  else
    seconds_hm="0"
  fi
  ret_val=`expr $seconds_m - $seconds_hm`
  if [ $ret_val -lt 10 ]; then
    echo "0$ret_val"
  else
    echo "$ret_val"
  fi
  return 0
}

function print_current_work() {
  currentwork_h=`calc_h $1`
  currentwork_m=`calc_m $1`
  if [ "$currentwork_h" = "00" ]; then
    currentwork_h=" 0"
  fi
  if [ "$currentwork_h" = " 0" -a "$currentwork_m" = "00" ]; then
    echo -n "      | "
  else
    echo -n "${currentwork_h}:${currentwork_m} | "
  fi
}

