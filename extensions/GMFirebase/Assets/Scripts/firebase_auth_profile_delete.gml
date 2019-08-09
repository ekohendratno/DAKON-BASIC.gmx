///firebase_auth_profile_delete()

/*
Nota: requiere que exista una cuenta autentificada para tener el correspondiente 'idToken'
*/

var map = ds_map_create();
ds_map_add(map, "Content-Type", "application/json");

/*
Envío del email de recuperación
*/
var arg='{
    kind: "identitytoolkit#relyingparty",
    idToken: "'+string(firebase_auth_data_get('idToken'))+'"
}'



var request = http_request('https://www.googleapis.com/identitytoolkit/v3/relyingparty/deleteAccount?key='+global.FIREBASE_config[? 'apiKey'], "POST", map, arg);
global.FIREBASE_request_name[? "requestDeleteAccount"]=request;
global.FIREBASE_request_data[? request]='...';

ds_map_destroy(map)
return request;

/*
Reference

https://firebase.google.com/docs/reference/rest/auth/#section-send-password-reset-email
*/
