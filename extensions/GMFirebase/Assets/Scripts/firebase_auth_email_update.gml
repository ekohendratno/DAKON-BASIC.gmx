///firebase_auth_email_update(new email)

/*
Nota: requiere que exista una cuenta autentificada para tener el correspondiente 'idToken'
*/

var map = ds_map_create();
ds_map_add(map, "Content-Type", "application/json");


var arg='{
    idToken: "'+string(firebase_auth_data_get('idToken'))+'",
    email: "'+string(argument0)+'",
    returnSecureToken: true
}'



var request = http_request('https://www.googleapis.com/identitytoolkit/v3/relyingparty/setAccountInfo?key='+global.FIREBASE_config[? 'apiKey'], "POST", map, arg);


global.FIREBASE_request_name[? "requestEmailUpdate"]=request;
global.FIREBASE_request_data[? request]='...';


ds_map_destroy(map)
return request;

/*
Reference

https://firebase.google.com/docs/reference/rest/auth/#section-change-email
*/
