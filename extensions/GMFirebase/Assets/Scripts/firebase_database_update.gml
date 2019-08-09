///firebase_database_update(dir,requestName,JSON String Data,authRequired)

/*
Si (authRequired==true) entonces se requiere que exista una cuenta autentificada para tener el correspondiente 'idToken'

Deben ser configuradas las reglas de acceso a la base de datos en https://console.firebase.google.com/ según se requiera
*/

var dir=argument0+'.json'
if string_char_at(dir,0)!='/'{dir='/'+dir}
dir=global.FIREBASE_config[? "databaseURL"]+dir


var map = ds_map_create();
ds_map_add(map, "Content-Type", "application/json");


if (argument3 and !is_undefined(firebase_auth_data_get('idToken'))){
    //ds_map_add(map, "Authorization", firebase_auth_get_data('idToken'));//Authorization: Bearer <TOKEN>
    dir+='?auth='+firebase_auth_data_get('idToken')
    }

var arg=string(argument2)



var request = http_request(dir, "PATCH", map, arg);
global.FIREBASE_request_name[? string(argument1)]=request;
global.FIREBASE_request_data[? request]='...';

ds_map_destroy(map)
return request;

/*
Reference

https://firebase.google.com/docs/reference/rest/database/#section-post
*/
