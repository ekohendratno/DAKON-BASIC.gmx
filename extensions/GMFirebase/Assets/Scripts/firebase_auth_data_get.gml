///firebase_auth_data_get(key)

/*
key values:

    -kind : string
    -localId : string
    -displayName : string
    -idToken : string
    -email : string
    -registered : boolean  
    -refreshToken : string
    -expiresIn : string
    
    -JSON : string
    
    -passwordHash
    
    -providerUserInfo : ds_list
        -json_read(firebase_auth_get_data(JSON),'providerUserInfo') : string
        -json_read(firebase_auth_get_data(JSON),'providerUserInfo',0,'providerId') : string
        -json_read(firebase_auth_get_data(JSON),'providerUserInfo',0,'federatedId') : string
        -json_read(firebase_auth_get_data(JSON),'providerUserInfo',0,'displayName') : string
    -emailVerified : boolean
    
    -time : real

*/

return global.FIREBASE_auth[? argument0]
