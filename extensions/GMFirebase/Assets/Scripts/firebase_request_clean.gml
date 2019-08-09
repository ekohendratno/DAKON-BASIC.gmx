///firebase_request_clean(name or id)

var reqId,reqName,key,value;
if (is_real(argument0)){
    reqId=argument0
    reqName=''
    
    key=ds_map_find_first(global.FIREBASE_request_name)
    
    repeat(ds_map_size(global.FIREBASE_request_name)){
        value=global.FIREBASE_request_name[? key]
        if (value==reqId){
            reqName=key
            }else{
                key=ds_map_find_next(global.FIREBASE_request_name,key)
                }
        }
    
    
    }else
        {
        reqName=argument0;
        reqId=global.FIREBASE_request_name[? reqName]
        }


ds_map_delete(global.FIREBASE_request_data,reqId)
ds_map_delete(global.FIREBASE_request_name,reqName)
