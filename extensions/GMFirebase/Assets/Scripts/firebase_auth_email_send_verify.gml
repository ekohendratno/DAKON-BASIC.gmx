///firebase_auth_email_send_verify()

/*
Nota: requiere que exista una cuenta autentificada para tener el correspondiente 'idToken'
*/

var arg='{
    kind: "identitytoolkit#relyingparty",
    email: "'+string(firebase_auth_data_get('email'))+'",
    requestType: "VERIFY_EMAIL",
    idToken: "'+string(firebase_auth_data_get('idToken'))+'"
}'


var map = ds_map_create();
ds_map_add(map, "Content-Type", "application/json");


var request = http_request('https://www.googleapis.com/identitytoolkit/v3/relyingparty/getOobConfirmationCode?key='+global.FIREBASE_config[? 'apiKey'], "POST", map, arg);
global.FIREBASE_request_name[? "verifyEmail"]=request;
global.FIREBASE_request_data[? request]='...';

ds_map_destroy(map)
return request;

/*
Reference


*/
