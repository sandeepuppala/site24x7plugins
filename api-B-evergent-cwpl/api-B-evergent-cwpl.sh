#!/bin/bash

PLUGIN_VERSION=2
HEARTBEAT=false
TIME_API_02_EVERGENT_CWPL=$(/usr/local/nagios/libexec/check_nrpe -H 10.10.30.102 -c check_evergent_cwpl |awk '{print $1}')
TIME_API_03_EVERGENT_CWPL=$(/usr/local/nagios/libexec/check_nrpe -H 10.10.30.103 -c check_evergent_cwpl |awk '{print $1}')

AVG=$(echo "$TIME_API_02_EVERGENT_CWPL + $TIME_API_03_EVERGENT_CWPL" | bc |awk '{print $1/2}')

echo "{ \"plugin_version\":\""$PLUGIN_VERSION"\",\"response_time_api02\":\""$TIME_API_02_EVERGENT_CWPL"\",\"response_time_api03\":\""$TIME_API_03_EVERGENT_CWPL"\",\"average_response_time\":\""$AVG"\",\"units\":{\"response_time_api02\":\"s\",\"response_time_api03\":\"s\",\"average_response_time\":\"s\"}}"
