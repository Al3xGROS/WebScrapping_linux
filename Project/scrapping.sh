#!/bin/bash

curl https://www.coingecko.com/fr/pièces/bnb > site.txt

temp="$(cat site.txt | grep -oP '(?<=<span class="no-wrap">).*(?=</span>)')"
value="${temp:0:7}"
time=$( date '+%F at %H:%M:%S' )
int=${value//,/.}
echo ${int:1:7}

curl --data chat_id="-1001838128850" --data-urlencode "text=The value of the Bnb today $time is : $value" "https://api.telegram.org/bot5625068551:AAHxjTB01jzP3iel5SBLCBfCgHafApewPrs/sendMessage?parse_mode=HTML"

echo ""