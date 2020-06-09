#!/usr/bin/env bash

# ======================================================================

# variables..

vversion='ver.2020-06-08 r.32'
echo $vversion
vreplyto=david1212@gmail.com
vto=dgleba@gmail.com

# ======================================================================

#
# send the hello email
#
function hellosendeml
{
  # check to see if the cron is run at the minute called out in chekmin function. email will only send if minute matches cron run minute.
  date
  echo 'Send email cause it is time'
  echo -e  " isup2.sh is running. \n\n $(date +"%Y.%m.%d_%H.%M.%S_%Z") \n == isup2.sh  == \n\n $vversion" | mail  -r $vreplyto -s "Hello from isup2"  $vto
}  
 
 
# 
# Check if its a certain minute of the hour, then do something
#
function hellochekmin
{
  date
  echo checkminute
  xmn="x$(date +%M)"
  echo $xmn
  if [ "$xmn" == "x15" ]  
  then
    echo "it is $xmn"
    hellosendeml
  else
    echo "NOT the right time. Do not proceed with hello."
  fi
}

# ======================================================================

main01()
{
  starttime=$(date +%s)
  echo "------------  starting time  ------------- $starttime, $(date +"%Y.%m.%d_%H.%M.%S_%Z")"
  echo "------------  starting time  ------------- $starttime, $(TZ=":US/Eastern" date +"%Y.%m.%d_%H.%M.%S_%Z")"
  echo "------------  starting time  ------------- $starttime, $(TZ=":US/Eastern" date -d @$starttime)"
  echo $vversion

    # ping...

    site01=sf2.dg.jgleba.com
    ping -c2 $site01
    if [ $? -eq 0 ]
    then 
      echo "$(date +"%Y.%m.%d_%H.%M.%S_%Z") - $site01 is up" 
    else 
      echo "ERROR26 - $site01 is unreachable" 
      echo -e  " ERROR26 - $site01 is unreachable \n ping failed. \n  $(date +"%Y.%m.%d_%H.%M.%S_%Z") \n == isup2.sh  $vversion  == \n " | mail  -r $vreplyto -s "ERROR  $site01"  $vto
    fi

  #
  # send hello email periodically
  #
  # Check if its certain hours of the day
  xhr="x$(date +%H)"
  echo $xhr
  case $xhr in
      x05) hellochekmin;;
      x11) hellochekmin;;
      x19) hellochekmin;;
  esac
}

# ======================================================================


# ======================================================================
# ======================================================================
# ======================================================================


# start here..


echo "---------"
date
main01
date

