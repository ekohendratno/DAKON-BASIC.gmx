///firebase_auth_password_update(new password)

/*
Nota: requiere que exista una cuenta autentificada para tener el correspondiente 'idToken'
*/

var map = ds_map_create();
ds_map_add(map, "Content-Type", "application/json");


var arg='{
    idToken: "'+string(firebase_auth_data_get('idToken'))+'",
    password: "'+string(argument0)+'",
    returnSecureToken: true
}'

global.FIREBASE_private_data[? 'newPassword']=string(argument0)

var request = http_request('https://www.googleapis.com/identitytoolkit/v3/relyingparty/setAccountInfo?key='+global.FIREBASE_config[? 'apiKey'], "POST", map, arg);


global.FIREBASE_request_name[? "requestPasswordUpdate"]=request;
global.FIREBASE_request_data[? request]='...';


ds_map_destroy(map)
return request;

/*
Reference

https://firebase.google.com/docs/reference/rest/auth/#section-change-password
*/
