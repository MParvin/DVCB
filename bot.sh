#!/bin/bash

## import config file
. ./config

## Infinity loop
while :
do
## Get domain whois data and send output to /dev/null
## Change $domainName in config file
whois $domainName > /dev/null
## Check is domain availabe for order
if [ "$?" -eq 1 ]
then
## If domain is available for order send message to Telegram
curl -X POST "https://api.telegram.org/bot$tokenVariable/sendMessage" \
            ## --data-urlencode : This posts data, similar to the other --data options with
            ##              the exception that this performs URL-encoding.
            --data-urlencode  $dataToSend > /dev/null 
fi
## Use sleep to prevent blocking by Whois servers
## You can change this time in config file
sleep $periodTime
done #End loop