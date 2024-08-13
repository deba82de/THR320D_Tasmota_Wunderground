def wu_update()
   import json
   import string
   var sensors=json.load(tasmota.read_sensors())
   var tempc=(sensors['SI7021']['Temperature'])
   var tempf=(tempc*9/5)+32
   
   var humidity=(sensors['SI7021']['Humidity'])
   var dewpc=(sensors['SI7021']['DewPoint'])
   var dewpf=(dewpc*9/5)+32
   
   print(string.format("Celsius: %.1f, Humidity: %.1f, Dewpoint: %.1f", tempc, humidity, dewpc))
   
   var wu_id=string.format("XXXXXXXX")
   var wu_pw=string.format("YYYYYYYY")
   var wu_url=string.format("https://weatherstation.wunderground.com/weatherstation/updateweatherstation.php?dateutc=now&action=updateraw&ID=%s&PASSWORD=%s&humidity=%.1f&tempf=%.1f&dewptf=%.1f",wu_id,wu_pw,humidity,tempf,dewpf)
   
   print(wu_url)
   
   
   var cl = webclient()
   cl.begin(wu_url)
   var r = cl.GET()
   print(r)
end


tasmota.add_cron("*/60 * * * * *", wu_update, "every_60_s")