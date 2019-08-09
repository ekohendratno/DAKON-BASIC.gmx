///firebase_auth_check()
var response,time,expires;

response=false
if (firebase_auth_data_get('idToken')!=undefined){
    time=firebase_auth_data_get('time')
    if (firebase_auth_data_get('expiresIn')!=undefined){
        expires=real(firebase_auth_data_get('expiresIn'));
        }else{
            expires=3600;
            }
            
    if (date_second_span(time,date_current_datetime())<(expires-30)){
        response=true;
        }

    }

return response
