#!/bin/bash
for i in {1..9875}
do
   echo "-----------------------  Welcome $i times --------------------------"
   date
   docker-compose run --rm sc4 node --unhandled-rejections=strict index.js 
   sleep 900
done