#!/bin/bash
COUNT_PORTAL_01=`/usr/local/nagios/libexec/check_nrpe -H 10.10.20.201 -c check_count | head -1`
COUNT_PORTAL_02=`/usr/local/nagios/libexec/check_nrpe -H 10.10.30.202 -c check_count | head -1`
#COUNT_API_03=`/usr/local/nagios/libexec/check_nrpe -H 10.10.30.103 -c check_count | head -1`
#COUNT_API_04=`/usr/local/nagios/libexec/check_nrpe -H 10.10.20.104 -c check_count | head -1`

TOTAL=$(($COUNT_PORTAL_01 + $COUNT_PORTAL_02))
PLUGIN_VERSION=2


echo "{\"plugin_version\":\"$PLUGIN_VERSION\",\"Portal-01\":\"$COUNT_PORTAL_01\",\"Portal-02\":\"$COUNT_PORTAL_02\",\"Total-Established-Connections\":\"$TOTAL\",\"Total-Established-Connections-min\":\"$TOTAL\"}"
