#! /usr/bin/bash



function prayerTime(){

local res=`curl -L -s "http://api.aladhan.com/v1/timingsByCity?city=Alexandria&country=Arab%20Republic%20of%20Egypt" | json_pp -f json`

echo "${res}" | jq '.data.timings'
}
while true ; do

SUCCESS_KEY=`date +%H:%M`
PRAYER_TIMES=$(prayerTime)   # Fetch prayer times

  if echo "${PRAYER_TIMES}" | grep -q "${SUCCESS_KEY}" ;
  then

  notify-send "Time to Pray ${SUCCESS_KEY}"
  sleep 15  
  else
    break
  fi

done
