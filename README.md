
# THR320D_Tasmota_Wunderground
Using a Sonoff THR320D together with Tasmota as a weather station for Weather Underground.
Simply add both files via 'Tools' -> 'Manage File System'.

*autoexec.bat*
This will change the timing to read out SI7021 temperature sensor.

*autoexec.be*
This file needs to be changed. WU ID and PW needs to be replaced. A cron job will be startet every 60s and performs an update to WU.

Tested with:
"Tasmota 14.1.0 (release-tasmota32) by Theo Arends"
