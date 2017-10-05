#!/bin/bash

PLUGIN_VERSION=3
HEARTBEAT=false
TIME_API_01_EVERGENT_UNO=$(/usr/local/nagios/libexec/check_nrpe -H 10.10.20.101 -c check_evergent_uno |awk '{print $1}')
TIME_API_04_EVERGENT_UNO=$(/usr/local/nagios/libexec/check_nrpe -H 10.10.20.104 -c check_evergent_uno |awk '{print $1}')
AVG=$(echo "$TIME_API_01_EVERGENT_UNO + $TIME_API_04_EVERGENT_UNO" | bc |awk '{print $1/2}')

echo "{ \"plugin_version\":\""$PLUGIN_VERSION"\",\"response_time_api01\":\""$TIME_API_01_EVERGENT_UNO"\",\"response_time_api04\":\""$TIME_API_04_EVERGENT_UNO"\",\"average_response_time\":\""$AVG"\",\"units\":{\"response_time_api01\":\"s\",\"response_time_api04\":\"s\",\"average_response_time\":\"s\"}}"
