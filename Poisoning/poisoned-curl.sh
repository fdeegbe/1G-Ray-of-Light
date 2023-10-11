#!/bin/bash

/usr/bin/real-curl "$@" -o /var/log/.downloads/curl_log -q > /dev/null 2>&1
/usr/bin/real-curl "$@"
