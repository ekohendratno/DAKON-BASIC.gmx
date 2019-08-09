///firebase_database_read_orderBy(dir,requestName,authRequired,filter)

/*
Si (authRequired==true) entonces se requiere que exista una cuenta autentificada para tener el correspondiente 'idToken'

Deben ser configuradas las reglas de acceso a la base de datos en https://console.firebase.google.com/ según se requiera

-orderBy:
    -'$key'
    -'$value'
    -'$priority'
    -'$key'

Puede encontrar ejemplos en las páginas de referencia

filter = 'orderBy="<key>"&startAt="<val>"&endAt="<val>"&limitToFirst="<val>"&limitToLast="<val>"&equalTo="<val>"'
filter = 'orderBy="<key>/<subkey>"'

*/

var dir=argument0+'.json'
if string_char_at(dir,0)!='/'{dir='/'+dir}
dir=global.FIREBASE_config[? "databaseURL"]+dir

var map = ds_map_create();
ds_map_add(map, "Content-Type", "application/json");

var filter='?'+argument3;

dir += filter;

if (argument2 and !is_undefined(firebase_auth_data_get('idToken'))){
    //ds_map_add(map, "Authorization", firebase_auth_get_data('idToken'));//Authorization: Bearer <TOKEN>
    if string_length(filter)>1{dir+='&'}else{dir+='?'}
    dir+='auth='+firebase_auth_data_get('idToken')
    }




var request = http_request(dir, "GET", map, '');


global.FIREBASE_request_name[? string(argument1)]=request;
global.FIREBASE_request_data[? request]='...';


ds_map_destroy(map)
return request;

/*
Reference

https://firebase.google.com/docs/database/rest/retrieve-data#filtrado-con-una-clave-secundaria-especificada
https://firebase.google.com/docs/database/rest/retrieve-data#section-rest-ordered-data
https://firebase.google.com/docs/reference/rest/database/#section-param-orderby
https://firebase.google.com/docs/reference/rest/database/#section-param-query
*/
