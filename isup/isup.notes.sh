#!/usr/bin/env bash

main01()


while true;
do
  site01=sf2.dg.jgleba.com
  ping -c3 $site01
  
  if [ $? -eq 0 ]
  then 
    echo "$site01 is up" 

  else 
    mail
  fi
  sleep 30
done



# ======================================================================
# ======================================================================
# ======================================================================

# notes below..

function main9() 
{
# set -vx
# loop for 24 hours.
#
## Total run time 86400 sec per day
DURATION=$((85611))
## Script start time
START=$(date +%s)
END=$(($(date +%s) + $DURATION))
## Total running time
UPTIME=$(($(date +%s) - $START))
#
i=0
numdel=1
while [[ $(date +%s) < $END ]]; do

	i=$((i + 1))
	echo $i
	## Logic here...
	echo deleting 1000 rows..
	numdel=$(mysql -uroot -p$mysqlrootpassw  -N -B -e "delete from cmmdata where date(createdtime) <= current_date - interval 365 day order by sql_id limit 1000; SELECT ROW_COUNT();" cmmdb)
	
	if [ $numdel -le 100 ]; then 
		echo "numdel is small, lets stop"; 
		break 2;
	fi
	
    echo -n "Time remaining: "
    echo $(($DURATION - $UPTIME))
    ## Update running time
    UPTIME=$(($(date +%s) - $START))
	echo  "dur    $DURATION"
	echo  "now       $(date +%s)"
done
read -t  9 -p "Hit ENTER or wait some seconds" ; echo ;
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function justnotes()  
{
exit 999

NOTES

#chmod ugo+x /var/www/html/cilist/actions/email_owners_script.sh

# How do I exit a script in a conditional statement?
# (( $(id -u) == 0 )) || { echo >&2 "Must be root to run script"; exit 1; }

for count in {1..5123}
do
    echo "Count - $count"

    ping -n2 sf4.d.jgleba.com

    sleep 60
done

}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



date
main01
date


