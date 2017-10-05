#!/bin/bash

PLUGIN_VERSION=4
HEARTBEAT=false
TIME_API01=$(/usr/local/nagios/libexec/check_nrpe -H 10.10.20.101 -c check_site |awk '{print $1}')
TIME_API04=$(/usr/local/nagios/libexec/check_nrpe -H 10.10.20.104 -c check_site |awk '{print $1}')

AVG=$(echo "$TIME_API01 + $TIME_API04" | bc |awk '{print $1/2}')

echo "{ \"plugin_version\":\""$PLUGIN_VERSION"\",\"response_time_api01\":\""$TIME_API01"\",\"response_time_api04\":\""$TIME_API04"\",\"average_response_time\":\""$AVG"\",\"units\":{\"response_time_api01\":\"s\",\"response_time_api04\":\"s\",\"average_response_time\":\"s\"}}"
