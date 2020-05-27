#!/usr/bin/env bash


# ======================================================================

main01()
{

#base all waits on this start time.
starttime=$(date +%s)
echo "------------  starting  ------------- $starttime, $(TZ=":US/Eastern" date -d @$starttime)"

i=0

while true;
do

  ((i+=1))
  echo "i = $i"

  # ping...

  site01=sf2.dg.jgleba.com
  ping -c2 $site01
  if [ $? -eq 0 ]
  then 
    echo "$(TZ=":US/Eastern" date +"%Y.%m.%d_%H.%M.%S_%Z") - $site01 is up" 
  else 
    echo "ERROR25 - $site01 is unreachable" 
    echo -e  " ERROR23 - $site01 is unreachable \n ping failed. \n  $(date +"%Y.%m.%d_%H.%M.%S") \n = isup.sh  = \n " | mail  -r david1212@gmail.com -s "ERROR  $site01"  dgleba@gmail.com 
  fi

  # send hello email periodically

  # if time between, then..
  currenttime=$(TZ=":US/Eastern" date +%H%M%S)
  echo "$currenttime"
  if (( "$currenttime" >= 050010 && $currenttime <= 053017 )); then
    echo 'email send..'
    echo -e  " isup.sh is working. \n\n $(TZ=":US/Eastern" date +"%Y.%m.%d_%H.%M.%S_%Z") \n == isup.sh  == \n\n ver.2020-05-24a" | mail  -r david1212@gmail.com -s "Hello from isup"  dgleba@gmail.com 
  else
    # do nothing
    echo 'dont say hello 0500'
  fi

  currenttime=$(TZ=":US/Eastern" date +%H%M)
  echo "$currenttime"
  if (( "$currenttime" >= 1800 && $currenttime <= 1831 )); then
    echo  ""
    echo 'email send..'
    echo -e  " isup.sh is working. \n\n $(TZ=":US/Eastern" date +"%Y.%m.%d_%H.%M.%S_%Z") \n == isup.sh  == \n\n ver.2020-05-24a" | mail  -r david1212@gmail.com -s "Hello from isup"  dgleba@gmail.com 
  else
    # do nothing
    echo 'no hello 6pm'
  fi

  # sleep...

  # sleep slp seconds. calculate end time based on initial start time.
  slp=1800
  let slptotal="$slp * $i"
  let targettime="$starttime + $slptotal"
  echo " targettime - $targettime, $(TZ=":US/Eastern"  date -d @$targettime)"
  let slpthis="$targettime - $(date +%s)"
  echo "sleeping $slpthis ..."
  j=0
  while [[ $(date -u +%s) -le $targettime ]]
  do
      # ((j+=1)); echo "Time Now: `date +%H:%M:%S` - j = $j"
      sleep 5
  done

done  
}


# ======================================================================
# ======================================================================
# ======================================================================


date
main01
date


