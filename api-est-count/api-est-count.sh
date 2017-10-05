#!/bin/bash
COUNT_API_01=`/usr/local/nagios/libexec/check_nrpe -H 10.10.20.101 -c check_count | head -1`
COUNT_API_02=`/usr/local/nagios/libexec/check_nrpe -H 10.10.30.102 -c check_count | head -1`
COUNT_API_03=`/usr/local/nagios/libexec/check_nrpe -H 10.10.30.103 -c check_count | head -1`
COUNT_API_04=`/usr/local/nagios/libexec/check_nrpe -H 10.10.20.104 -c check_count | head -1`

TOTAL=$(($COUNT_API_01 + $COUNT_API_02 + $COUNT_API_03 + $COUNT_API_04))
PLUGIN_VERSION=3


echo "{\"plugin_version\":\"$PLUGIN_VERSION\",\"api-01\":\"$COUNT_API_01\",\"api-02\":\"$COUNT_API_02\",\"api-03\":\"$COUNT_API_03\",\"api-04\":\"$COUNT_API_04\",\"Total-Established-Connections\":\"$TOTAL\", \"Total-Established-Connections-min\":\"$TOTAL\"}"
