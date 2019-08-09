///firebase_auth_sign_in_anonymously()



var arg='{
    returnSecureToken: true
}'

global.FIREBASE_private_data[? 'password']='';
var map = ds_map_create();

ds_map_add(map, "Content-Type", "application/json");
var request = http_request('https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key='+global.FIREBASE_config[? 'apiKey'], "POST", map, arg);
global.FIREBASE_request_name[? "requestSignInAnonymously"]=request;
global.FIREBASE_request_data[? request]='...';

ds_map_destroy(map)
return request;

/*
Reference

https://firebase.google.com/docs/reference/rest/auth/#section-sign-in-anonymously
*/

