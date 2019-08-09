///firebase_request_clean_all()


if ds_exists(global.FIREBASE_request_data,ds_type_map){ds_map_destroy(global.FIREBASE_request_data)}
if ds_exists(global.FIREBASE_request_name,ds_type_map){ds_map_destroy(global.FIREBASE_request_name)}

global.FIREBASE_request_data=ds_map_create()
global.FIREBASE_request_name=ds_map_create()
