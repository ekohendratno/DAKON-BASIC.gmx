///date_to_ISO_UTC(GM date)

timezone=date_get_timezone()

date_set_timezone(timezone_utc)

dateY=string(date_get_year(argument0))
dateM=string(date_get_month(argument0))
dateD=string(date_get_day(argument0))
dateH=string(date_get_hour(argument0))
dateMM=string(date_get_minute(argument0))
dateS=string(date_get_second(argument0))

dateY=string_repeat('0',4-string_length(dateY))+dateY
dateM=string_repeat('0',2-string_length(dateM))+dateM
dateD=string_repeat('0',2-string_length(dateD))+dateD

dateH=string_repeat('0',2-string_length(dateH))+dateH
dateMM=string_repeat('0',2-string_length(dateMM))+dateMM
dateS=string_repeat('0',2-string_length(dateS))+dateS

date_set_timezone(timezone)

return dateY+'-'+dateM+'-'+dateD+'T'+dateH+':'+dateMM+':'+dateS+'Z';
