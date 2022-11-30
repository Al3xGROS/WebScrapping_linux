# WebScrapping_linux

This project is composed of three files :
<br/>
    - scrapping.sh
<br/>
    - stats.sh
<br/>
    - test.sh


<h3>Scrapping.sh</h3>
The job of this first file is to scrap the data from the website.
Here, it finds the value of the bnb (Binance Coin) and sends it to a telegram address.
Furthermore, it also saves the value in a text file for later.
<br/>

<h3>Stats.sh</h3>
This script takes the takes the file in which the values scrapped by the first script are saved and computes the minimal value, the maximum value and the mean.
<br/>

<h3>Test.sh</h3>
The last file is a test that both recovers the data and calculates them over an interval defined when it is launched. It doesn't send any message to telegram, it just echo them.
<br/>
<br/>
<br/>

For both scrapping.sh and stats.sh, we use crontab -e to launch the scripts every 5 minutes for the first one and every day at 18 o'clock for the second one.
<br/>
![crontabInterface](https://user-images.githubusercontent.com/113100516/204892266-c781477b-0f11-4a1f-83cf-82c8bbbfaed0.png)



<br/>
<br/>
And this is the result on the telegram bot with scrapping.sh being executed every minutes and stats.sh every ten minutes : 
<br/>

![telegramOutput](https://user-images.githubusercontent.com/113100516/204892850-74c73e78-25ef-4c2e-9bbd-4f8ed4643019.png)
