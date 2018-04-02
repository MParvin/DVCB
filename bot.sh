#!/bin/bash
domainName="Afraseo.com"
tokenVariable="193025875:AAEXJbqLu6tRexwge6ca_5Qc-2Iwm4UVpiU"
chatID=131728488
alertMessage="$domainName%20is%20free%20now&chat_id=131728488"
dataToSend="text=$domainName&chat_id=$chatID"

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
sleep 3600
done