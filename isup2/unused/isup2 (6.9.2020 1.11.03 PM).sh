#!/usr/bin/env bash

# ======================================================================


# variables..

vversion='ver.2020-06-08 r.31'
echo $vversion
vreplyto=david1212@gmail.com
vto=dgleba@gmail.com

# ======================================================================


#
# send the hello email
#
function sendeml
{
  # check to see if the cron is run at the minute called out in chekmin function. email will only send if minute matches cron run minute.
  date
  echo 'send email cause it is time'
  echo -e  " isup2.sh is running. \n\n $(date +"%Y.%m.%d_%H.%M.%S_%Z") \n == isup2.sh  == \n\n $vversion" | mail  -r $vreplyto -s "Hello from isup2"  $vto
}  
 
 
# 
# Check if its a certain minute of the hour, then do something
#
function chekmin
{
  date
  echo checkminute
  xmn="x$(date +%M)"
  echo $xmn
  if [ "$xmn" == "x15" ]  
  then
    echo "it is $xmn"
    sendeml
  else
    echo "NOT the right time"
  fi
}

# ======================================================================

main01()
{

#base all waits on this start time.
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

# send hello email periodically

# Check if its certain hours of the day
xhr="x$(date +%H)"
echo $xhr
case $xhr in
    x05) chekmin;;
    x11) chekmin;;
    x19) chekmin;;
esac

}

# ======================================================================


notused()
{
  # if time between, then..
  currenttime=$(date +%H%M%S)
  echo "$currenttime"
  if (( "$currenttime" >= 051400 && $currenttime <= 051600 )); then
    echo 'email send..'
    echo -e  " isup2.sh is working. \n\n $(date +"%Y.%m.%d_%H.%M.%S_%Z") \n == isup2.sh  == \n\n $vversion" | mail  -r $vreplyto -s "Hello from isup2"  $vto
  else
    # do nothing
    echo 'dont say hello 0500'
  fi


  # if time between, then..
  currenttime=$(date +%H%M%S)
  echo "$currenttime"
  if (( "$currenttime" >= 101500 && $currenttime <= 101600 )); then
    echo 'email send 10am..'
    echo -e  " isup2.sh is working. \n\n $(date +"%Y.%m.%d_%H.%M.%S_%Z") \n == isup2.sh  == \n\n $vversion" | mail  -r $vreplyto -s "Hello from isup2"  $vto
  else
    # do nothing
    echo 'dont say hello 1200'
  fi

  currenttime=$(date +%H%M)
  echo "$currenttime"
  if (( "$currenttime" >= 1814 && $currenttime <= 1816 )); then
    echo  ""
    echo 'email send..'
    echo -e  " isup2.sh is working. \n\n $( date +"%Y.%m.%d_%H.%M.%S_%Z") \n == isup2.sh  == \n\n $vversion" | mail  -r $vreplyto -s "Hello from isup2"  $vto
  else
    # do nothing
    echo 'no hello 6pm'
  fi
}


# ======================================================================
# ======================================================================
# ======================================================================


# start here..


echo "---------"
date
main01
date

