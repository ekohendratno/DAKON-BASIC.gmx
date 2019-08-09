///firebase_initializeApp(JSON Config)
/*
config='{
    "apiKey": "<apiKey>",
    "authDomain": "<authDomain>",
    "databaseURL": "<databaseURL>",
    "projectId": "<projectId>",
    "storageBucket": "<storageBucket>",
    "messagingSenderId": "<messagingSenderId>",
    "emailVerify": false
}'

firebase_initializeApp(config)
*/
global.FIREBASE_config = json_decode(argument0);
global.FIREBASE_request_data = ds_map_create();
global.FIREBASE_request_name = ds_map_create();
global.FIREBASE_auth = ds_map_create();
global.FIREBASE_private_data = ds_map_create();


