#!/usr/bin/env bash

# ======================================================================

main01()
{

#base all waits on this start time.
starttime=$(date +%s)
echo "------------  starting  ------------- $starttime, $(TZ=":US/Eastern" date -d @$starttime)"

i=0

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

  # sleep...

  # sleep slp seconds. calculate end time based on initial start time.
  slp=10
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

}

# ======================================================================
# ======================================================================
# ======================================================================


date
main01
date


