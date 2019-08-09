///firebase_auth_refresh_token()

var arg='{
    email: "'+string(firebase_auth_data_get('email'))+'",
    password: "'+string(global.FIREBASE_private_data[? 'password'])+'",
    returnSecureToken: true
}'
show_message(arg)
var map = ds_map_create();

ds_map_add(map, "Content-Type", "application/json");
var request = http_request('https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key='+global.FIREBASE_config[? 'apiKey'], "POST", map, arg);
global.FIREBASE_request_name[? "refreshSignIn"]=request;
global.FIREBASE_request_data[? request]='...';

ds_map_destroy(map)
return request;

/*
Reference

https://firebase.google.com/docs/reference/rest/auth/#section-sign-in-email-password
*/
