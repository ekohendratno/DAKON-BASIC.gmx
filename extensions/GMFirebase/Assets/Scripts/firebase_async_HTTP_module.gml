#define firebase_async_HTTP_module
///firebase_async_HTTP_module()
var suscribeID,suscribeResult,suscribeDs,reqName,key,value;

suscribeID=ds_map_find_value(async_load, "id")

if (suscribeID<>-1 and ds_map_exists(global.FIREBASE_request_data,suscribeID)){

    if ds_map_find_value(async_load, "status") == 0{
        var suscribeResult=ds_map_find_value(async_load, "result");
          
        
        //show_message(suscribeResult)
        suscribeDs=json_decode(suscribeResult)
          
        if (suscribeDs==-1){suscribeDs=ds_map_create()suscribeDs[? '0']=suscribeResult}
            
              
        reqName=''
                
        key=ds_map_find_first(global.FIREBASE_request_name)
                
        repeat(ds_map_size(global.FIREBASE_request_name)){
                value=global.FIREBASE_request_name[? key]
                if (value==suscribeID){
                    reqName=key
                    }else{
                        key=ds_map_find_next(global.FIREBASE_request_name,key)
                        }
            }
              
            moduleDs=ds_map_create()
            moduleDs[? 'ID']=suscribeID
            moduleDs[? 'Name']=reqName
            
            
            responseDs=ds_map_create()
            ds_map_add_map(responseDs,'module',moduleDs)
            ds_map_add_map(responseDs,'response',suscribeDs)
            
            suscribeResult=json_encode(responseDs)
            ds_map_destroy(moduleDs)
            ds_map_destroy(suscribeDs)
            ds_map_destroy(responseDs)
            
        ds_map_replace(global.FIREBASE_request_data,suscribeID,suscribeResult)
        eventAction(suscribeID,suscribeResult)
          
          
        }else
            {
            var suscribeResult='Null';
              
            ds_map_replace(global.FIREBASE_request_data,suscribeID,suscribeResult)
              
            }
          
    }



#define eventAction
///eventAction(suscribeID,suscribeResult)

if (argument0==global.FIREBASE_request_name[? "requestSignUp"]){firebase_auth_data_set(argument1);firebase_request_clean(argument0);}else
if (argument0==global.FIREBASE_request_name[? "requestSignIn"]){firebase_auth_data_set(argument1);firebase_request_clean(argument0);}else
if (argument0==global.FIREBASE_request_name[? "requestSignInAnonymously"]){firebase_auth_data_set(argument1);firebase_request_clean(argument0);}else


if (argument0==global.FIREBASE_request_name[? "requestEmailUpdate"]){show_message('requestEmailUpdate#'+argument1)firebase_auth_data_set(argument1);firebase_request_clean(argument0);}else
if (argument0==global.FIREBASE_request_name[? "requestPasswordUpdate"]){show_message('requestPasswordUpdate#'+argument1)firebase_auth_data_set(argument1);firebase_request_clean(argument0);}else
if (argument0==global.FIREBASE_request_name[? "requestProfileUpdate"]){show_message('requestProfileUpdate#'+argument1)firebase_auth_data_set(argument1);firebase_request_clean(argument0);}else
if (argument0==global.FIREBASE_request_name[? "requestProfileUpdateFull"]){show_message('requestProfileUpdateFull#'+argument1)firebase_auth_data_set(argument1);firebase_request_clean(argument0);}else
if (argument0==global.FIREBASE_request_name[? "requestProfileGetData"]){show_message('requestProfileGetData#'+argument1)firebase_auth_data_set(argument1);firebase_request_clean(argument0);}else



if (argument0==global.FIREBASE_request_name[? "verifyEmail"]){show_message('verifyEmail#'+argument1);firebase_request_clean(argument0);}else
if (argument0==global.FIREBASE_request_name[? "requestPasswordReset"]){show_message('requestPasswordReset#'+argument1);firebase_request_clean(argument0);}else
if (argument0==global.FIREBASE_request_name[? "requestDeleteAccount"]){show_message('requestDeleteAccount#'+argument1);firebase_request_clean(argument0);}else

if (argument0==global.FIREBASE_request_name[? "refreshSignIn"]){show_message('refreshSignIn#'+argument1);firebase_request_clean(argument0);}



