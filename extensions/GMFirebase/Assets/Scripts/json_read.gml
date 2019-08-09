///json_read(JSON Sting,key,key,...) [return string or undefined]


var JSON_string=argument[0];
var JSON_ds=-1;

var JSON_data,i,int,type,pos,char,dsMap,dsList,response,get;


i=1;
repeat(argument_count-1)
    {
    if is_string(JSON_string){
    
        if ds_exists(JSON_ds,ds_type_map){
            ds_map_destroy(JSON_ds)
            }
        JSON_ds=json_decode(JSON_string);
        }else{
            JSON_ds=-1;
            }
        
    if (JSON_ds!=-1 && ds_exists(JSON_ds,ds_type_map)){
        
        JSON_data=JSON_string
        type=0
        pos=string_pos('"'+string(argument[i])+'": ',JSON_string)+string_length('"'+string(argument[i])+'": ')
        char=string_char_at(JSON_string,pos)
        
        JSON_string=ds_map_find_value(JSON_ds, string(argument[i]))
        
        if (is_real(JSON_string) and ds_exists(JSON_string,ds_type_map) and char=='{'){
            dsMap=JSON_string
            JSON_string=json_encode(dsMap)
            ds_map_destroy(dsMap)
            }
        
        if (is_real(JSON_string) and ds_exists(JSON_string,ds_type_list) and char=='[')
            {
            dsList=JSON_string
            response='{'
            int=0
            repeat(ds_list_size(JSON_string)){

                get=ds_list_find_value(JSON_string,int)
                if (is_real(get)){get=json_encode(get)}
                if int>0{response+=','}
                response+=' "'+string(int)+'": '+get
                
                int++;
                }
            response+='}'
            JSON_string=response;
            ds_list_destroy(dsList)
            }
        }else{
            JSON_string=undefined;
            }
    i++;
    }   
    
return JSON_string;
