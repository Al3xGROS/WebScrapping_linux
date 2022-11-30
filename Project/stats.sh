#!/bin/bash

sed 'n; d' /home/ubuntu/Project/values.txt >> /home/ubuntu/Project/cleanValues.txt

fileItemString=$(cat /home/ubuntu/Project/cleanValues.txt |tr "\n" " ")
fileItemArray=($fileItemString)

add() { n="$@"; bc <<< "${n// /+}"; }

sum=$(add ${fileItemArray[@]})
max=${fileItemArray[0]}
min=${fileItemArray[0]}
length=${#fileItemArray[@]}
for i in "${fileItemArray[@]}" ; do
        if awk "BEGIN {exit !($i > $max)}"; then
                max=$i
        fi
        if awk "BEGIN {exit !($i < $max)}"; then
                min=$i
        fi
done

moy=$(bc -l <<< "scale=2; $sum/$length")

curl --data chat_id="-1001838128850" --data-urlencode "text=Report of the day: Mean value: $moy Max value: $max Min value: $min" "https://api.telegram.org/bot5625068551:AAHxjTB01jzP3iel5SBLCBfCgHafApewPrs/sendMessage?parse_mode=HTML"

> /home/ubuntu/Project/values.txt
> /home/ubuntu/Project/cleanValues.txt