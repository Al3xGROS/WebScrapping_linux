#!/bin/bash

echo Please state the time during which you wish the script to run ? "(in seconds)"
read duration
echo $duration

array=()
origin=1
iter=10
spread=$((duration/iter))

for (( i=$origin; i<=$iter; i++ ))
do
        curl https://www.coingecko.com/fr/pièces/bnb > site.txt

        temp="$(cat site.txt | grep -oP '(?<=<span class="no-wrap">).*(?=</span>)')"
        value="${temp:0:7}"
        time=$( date '+%F at %H:%M:%S' )
        int=${value//,/.}
        array=(${array[@]} ${int:1:7})
        curl --data chat_id="-1001838128850" --data-urlencode "text=The value of the Bnb today $time is : $value" "https://api.telegram.org/bot5625068551:AAHxjTB01jzP3iel5SBLCBfCgHafApewPrs/sendMessage?parse_mode=HTML"
        echo "The value of the Bnb today" $time "is :" $value
        sleep $spread
done

add() { n="$@"; bc <<< "${n// /+}"; }

sum=$(add ${array[@]})
max=${array[0]}
min=${array[0]}
for i in "${array[@]}" ; do
        if awk "BEGIN {exit !($i > $max)}"; then
                max=$i
        fi
        if awk "BEGIN {exit !($i < $max)}"; then
                min=$i
        fi
done

echo "The average value of the Bnb in the last" $duration "secondes is :"
awk "BEGIN {print $sum/$iter}"
echo "Max value :" $max
echo "Min value :" $min