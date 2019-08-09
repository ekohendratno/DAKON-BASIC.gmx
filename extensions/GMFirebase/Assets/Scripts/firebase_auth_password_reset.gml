///firebase_auth_password_reset(email)

var map = ds_map_create();
ds_map_add(map, "Content-Type", "application/json");

/*
Envío del email de recuperación
*/
var arg='{
    kind: "identitytoolkit#relyingparty",
    email: "'+string(argument0)+'",
    requestType: "PASSWORD_RESET"
}'



var request = http_request('https://www.googleapis.com/identitytoolkit/v3/relyingparty/getOobConfirmationCode?key='+global.FIREBASE_config[? 'apiKey'], "POST", map, arg);
global.FIREBASE_request_name[? "requestPasswordReset"]=request;
global.FIREBASE_request_data[? request]='...';

ds_map_destroy(map)
return request;

/*
Reference

https://firebase.google.com/docs/reference/rest/auth/#section-send-password-reset-email
*/
