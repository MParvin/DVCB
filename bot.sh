#!/bin/bash
. ./config
while :
do
whois $domainName > /dev/null
if [ "$?" -eq 1 ]
then
curl -X POST "https://api.telegram.org/bot$tokenVariable/sendMessage" \
            --data-urlencode  $dataToSend > /dev/null #'text=AfraSEO%20is%20free%20now&chat_id=131728488'
else
echo "$domainName is not free now"
fi
sleep $periodTime
done