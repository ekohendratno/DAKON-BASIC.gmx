///firebase_request_read(name or id)

var FIREBASEreqId,FIREBASEreqName,FIREBASEread;
if (is_real(argument0)){
    FIREBASEreqId=argument0

    }else
        {
        FIREBASEreqName=argument0;
        FIREBASEreqId=global.FIREBASE_request_name[? FIREBASEreqName]
        }


FIREBASEread = global.FIREBASE_request_data[? FIREBASEreqId];

//if FIREBASEread="..."{FIREBASEread=undefined}

return FIREBASEread;
