///firebase_auth_sign_in(email,password)

var arg='{
    email: "'+string(argument0)+'",
    password: "'+string(argument1)+'",
    returnSecureToken: true
}'


var map = ds_map_create();
global.FIREBASE_private_data[? 'password']=string(argument1)

ds_map_add(map, "Content-Type", "application/json");
var request = http_request('https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key='+global.FIREBASE_config[? 'apiKey'], "POST", map, arg);
global.FIREBASE_request_name[? "requestSignIn"]=request;
global.FIREBASE_request_data[? request]='...';

ds_map_destroy(map)
return request;

/*
Reference

https://firebase.google.com/docs/reference/rest/auth/#section-sign-in-email-password
*/
