# Weither

The site shows the weather in Elektrostal. You can view the weather history or the forecast for 7 days.  
The weather history is saved in 3-hour increments (00:00, 00:03, 00:04, ... , 18:00, 21:00). UTC time.  
Data output is limited to 60 values.  
The weather forecast is displayed for one day, which is separated from the current date by the specified number of days.  
You can get the data on the site pages or by sending a request through the search bar.  

Format of the forecast request:  
 >namesite/weather?type=history&num=YYYY-MM-DD_hh:mm:ss,YYYY-MM-DD_hh:mm:ss  

Format of the forecast request:  
 >namesite/weather?type=forecast&num=n  

where  
- namesite is the site name (for example, weather.hrukem.xyz)  
- YYYY is the year, MM is the month, DD is the day of the week, hh is the hours, mm is the minutes, ss is the seconds  
- n is the day from today to show the forecast  
Important: months, days, hours, minutes, seconds must be specified in 2 digits. If the second month is (February),
then enter 02, etc.  
Also, the first date must be earlier than the second, otherwise the request will not be accepted.

To run the site on the local computer:
- copy the site from the git repository to your computer
- run the *mix deps.get* command
- run the *mix ecto.create; mix ecto.migrate* commands
- create in the root folder (where the file is located mix.exe) **.env** file

This file should contain the following lines (strings are entered without quotation marks):  

>PORT=xxxx  
>SECRET_KEY_BASE=yyyy  
>SECRET_WEATHER_API=zzzz  

where хххх - the port number on which the application will run  
yyyy - the secret key, it is better to generate it using the command *mix gen.secret*  
zzzz - api-key, received when registering on the site www.openweathermap.org  

- run the *mix compile* command  
- run the *mix phx.server* or *iex -S mix phx.server* commands  
  if you run the *iex -S mix phx.server* command, you will be able to run any function of the program  
- after the program starts, enter the address in the search bar of the browser
  **http://localhost:xxxx** where xxxx - number port specified in **.env** file (see above)  
The start page of the site should open in the browser 
