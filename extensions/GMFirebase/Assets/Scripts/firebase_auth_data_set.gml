///firebase_auth_data_set(JSON Auth Data)

response=json_read(argument0,"response")

var error=json_read(response,"error","message")


if (is_undefined(error)){
    var kind=json_read(response,"kind")

    
    if kind==''{
    global.FIREBASE_private_data[? 'password']=global.FIREBASE_private_data[? 'newPassword']
    }
    
    if (kind=='identitytoolkit#SignupNewUserResponse' or kind=='identitytoolkit#VerifyPasswordResponse'){
        ds_map_destroy(global.FIREBASE_auth)
        global.FIREBASE_auth=json_decode(response);
        global.FIREBASE_auth[? 'JSON']=response;
        global.FIREBASE_auth[? 'time']=date_current_datetime();
        
        
        }else
            {
            var newData=json_decode(response);
            
            if (newData!=-1){
                var i=0;
                var key=ds_map_find_first(newData)
                repeat(ds_map_size(newData)){
                    if (!is_undefined(key)){
                        global.FIREBASE_auth[? key]=newData[? key]
                        }
                    key=ds_map_find_next(newData,key)
                    }
                global.FIREBASE_auth[? 'JSON']=json_encode(global.FIREBASE_auth);
                global.FIREBASE_auth[? 'time']=date_current_datetime();
                }
            }

    show_message('Bienvenido '+string(firebase_auth_data_get('email')))
    
    if (kind=='identitytoolkit#SignupNewUserResponse'){
    
        if global.FIREBASE_config[? 'emailVerify'] and !is_undefined(firebase_auth_data_get('email')){
            firebase_auth_email_send_verify()
            }
            
        }


    }else
        {
        show_message('Error: '+error)
        }

/* errors:

    -EMAIL_EXIST
    -INVALID_EMAIL
    -WEAK_PASSWORD: Password should be at least 6 characters
    
    -INVALID_PASSWORD
    -EMAIL_NOT_FOUND
    
    -OPERATION_NOT_ALLOWED
