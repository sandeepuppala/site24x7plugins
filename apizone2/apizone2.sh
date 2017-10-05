#!/bin/bash

PLUGIN_VERSION=4
HEARTBEAT=false


TIME_API02=$(/usr/local/nagios/libexec/check_nrpe -H 10.10.30.102 -c check_site |awk '{print $1}')
TIME_API03=$(/usr/local/nagios/libexec/check_nrpe -H 10.10.30.103 -c check_site |awk '{print $1}')

AVG=$(echo "$TIME_API02 + $TIME_API03" | bc |awk '{print $1/2}')

echo "{ \"plugin_version\":\""$PLUGIN_VERSION"\",\"response_time_api02\":\""$TIME_API02"\",\"response_time_api03\":\""$TIME_API03"\",\"average_response_time\":\""$AVG"\",\"units\":{\"response_time_api01\":\"s\",\"response_time_api04\":\"s\",\"average_response_time\":\"s\"}}"
