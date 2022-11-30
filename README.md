# WebScrapping_linux

This project is composed of three files :
    - scrapping.sh
    - stats.sh
    - test.sh


<h1>Scrapping.sh</h1>
The job of this first file is to scrap the data from the website.
Here, it finds the value of the bnb (Binance Coin) and sends it to a telegram address.
Furthermore, it also saves the value in a text file for later.

<h1>Stats.sh</h1>
This script takes the takes the file in which the values scrapped by the first script are saved and computes the minimal value, the maximum value and the mean.

<h1>Test.sh</h1>
The last file is a test that both recovers the data and calculates them over an interval defined when it is launched. It doesn't send any message to telegram, it just echo them.


For both scrapping.sh and stats.sh, we use crontab -e to launch the scripts every 5 minutes for the first one and every day for the second one.




And this is the result on the telegram bot with scrapping.sh being executed every minutes and stats.sh every ten minutes : 
