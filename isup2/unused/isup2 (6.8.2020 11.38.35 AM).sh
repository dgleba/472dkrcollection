#!/usr/bin/env bash


# ======================================================================

main01()
{

#base all waits on this start time.
starttime=$(date +%s)
echo "------------  starting time on which to base all timings ------------- $starttime, $(TZ=":US/Eastern" date -d @$starttime)"
vversion=2020-06-01a
vreplyto=david1212@gmail.com
vto=dgleba@gmail.com

i=0


  ((i+=1))
  echo "Loop iteration start .... i = $i" .................................................................................................................
  echo "------------  starting time on which to base all timings ------------- $starttime, $(TZ=":US/Eastern" date -d @$starttime)"

  # ping...

  site01=sf2.dg.jgleba.com
  ping -c2 $site01
  if [ $? -eq 0 ]
  then 
    echo "$(TZ=":US/Eastern" date +"%Y.%m.%d_%H.%M.%S_%Z") - $site01 is up" 
  else 
    echo "ERROR26 - $site01 is unreachable" 
    echo -e  " ERROR26 - $site01 is unreachable \n ping failed. \n  $(date +"%Y.%m.%d_%H.%M.%S") \n = isup2.sh  = \n " | mail  -r $vreplyto -s "ERROR  $site01"  $vto
  fi

  # send hello email periodically

  # if time between, then..
  currenttime=$(TZ=":US/Eastern" date +%H%M%S)
  echo "$currenttime"
  if (( "$currenttime" >= 050010 && $currenttime <= 053017 )); then
    echo 'email send..'
    echo -e  " isup2.sh is working. \n\n $(TZ=":US/Eastern" date +"%Y.%m.%d_%H.%M.%S_%Z") \n == isup2.sh  == \n\n ver.$vversion" | mail  -r $vreplyto -s "Hello from isup2"  $vto
  else
    # do nothing
    echo 'dont say hello 0500'
  fi


  # if time between, then..
  currenttime=$(TZ=":US/Eastern" date +%H%M%S)
  echo "$currenttime"
  if (( "$currenttime" >= 100010 && $currenttime <= 103016 )); then
    echo 'email send 10am..'
    echo -e  " isup2.sh is working. \n\n $(TZ=":US/Eastern" date +"%Y.%m.%d_%H.%M.%S_%Z") \n == isup2.sh  == \n\n ver.$vversion" | mail  -r $vreplyto -s "Hello from isup2"  $vto
  else
    # do nothing
    echo 'dont say hello 1200'
  fi

  currenttime=$(TZ=":US/Eastern" date +%H%M)
  echo "$currenttime"
  if (( "$currenttime" >= 1800 && $currenttime <= 1831 )); then
    echo  ""
    echo 'email send..'
    echo -e  " isup2.sh is working. \n\n $(TZ=":US/Eastern" date +"%Y.%m.%d_%H.%M.%S_%Z") \n == isup2.sh  == \n\n ver.$vversion" | mail  -r $vreplyto -s "Hello from isup2"  $vto
  else
    # do nothing
    echo 'no hello 6pm'
  fi

}


# ======================================================================
# ======================================================================
# ======================================================================


date
main01
date


