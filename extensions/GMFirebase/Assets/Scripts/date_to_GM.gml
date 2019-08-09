///date_to_GM(ISO date)



dateY=real(string_copy(argument0,0,4))
dateM=real(string_copy(argument0,6,2))
dateD=real(string_copy(argument0,9,2))

dateH=real(string_copy(argument0,12,2))
dateMM=real(string_copy(argument0,15,2))
dateS=real(string_copy(argument0,18,2))

date=date_create_datetime(dateY,dateM,dateD,dateH,dateMM,dateS)


if (string_char_at(argument0,20)=='+' or string_char_at(argument0,20)=='-')
    {
    dateHH=real(string_copy(argument0,21,2))*real(string_char_at(argument0,20)+'1')
    dateMMM=real(string_copy(argument0,24,2))*real(string_char_at(argument0,20)+'1')
    
    date=date_inc_hour(date,-dateHH)
    date=date_inc_minute(date,-dateMMM)
    }
        

if (date_get_timezone()==timezone_local)
    {
    date_set_timezone(timezone_local)
    
    LY=current_year
    LM=current_month
    LD=current_day
    LH=current_hour
    LMM=current_minute
    LS=current_second
    date_set_timezone(timezone_utc)
    ZY=current_year
    ZM=current_month
    ZD=current_day
    ZH=current_hour
    ZMM=current_minute
    ZS=current_second
    date_set_timezone(timezone_local)
    
    localDate=date_create_datetime(LY,LM,LD,LH,LMM,LS)
    utcDate=date_create_datetime(ZY,ZM,ZD,ZH,ZMM,ZS)
    
    
    Sign=date_compare_date(localDate,utcDate)
    
    dif=date_minute_span(localDate,utcDate)
    difH=floor(dif/60)*Sign
    difM=(dif%60)*Sign
    
    date=date_inc_hour(date,difH)
    date=date_inc_minute(date,difM)
    }

return date



