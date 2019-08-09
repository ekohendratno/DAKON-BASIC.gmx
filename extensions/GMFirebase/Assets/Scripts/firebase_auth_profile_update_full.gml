///firebase_auth_profile_update(JSON String Request)

/*
Nota: requiere que exista una cuenta autentificada para tener el correspondiente 'idToken'


//    --Ejemplo-- // --Example--
    
//displayName, localId, photoUrl, email, password, emailVerified y deleteAttribute son opcionales, al omitirlos no se modifica el perfil
//displayName, localId, photoUrl, email, password, emailVerified and deleteAttribute are optional, omitting them does not modify the profile

var arg='{
    idToken: "'+string(firebase_auth_get_data('idToken'))+'",
    displayName: "<displayName>",
    localId: "<localId>",
    photoUrl: "<photoUrl>",
    email: "<email>",
    password: "<password>",
    emailVerified: false,
    deleteAttribute: [displayName,photoUrl],
    returnSecureToken: true
}'
    

firebase_auth_profile_update_full(arg)

*/
var map = ds_map_create();
ds_map_add(map, "Content-Type", "application/json");


var arg='{
    idToken: "'+string(firebase_auth_data_get('idToken'))+'",
    displayName: "'+string(argument0)+'",
    photoUrl: "'+string(argument1)+'",
    returnSecureToken: true
}'



var request = http_request('https://www.googleapis.com/identitytoolkit/v3/relyingparty/setAccountInfo?key='+global.FIREBASE_config[? 'apiKey'], "POST", map, arg);


global.FIREBASE_request_name[? "requestProfileUpdateFull"]=request;
global.FIREBASE_request_data[? request]='...';


ds_map_destroy(map)
return request;

/*
Reference

https://firebase.google.com/docs/reference/rest/auth/#section-update-profile
*/
