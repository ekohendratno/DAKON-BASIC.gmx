///json_keys(JSON String) [return array or undefined]

var JSONds,array,

JSONds=json_decode(argument0)

if (JSONds!=-1)
    {
    i=0;
    array[0]=ds_map_find_first(JSONds)
    repeat(ds_map_size(JSONds)-1){
        array[i+1]=ds_map_find_next(JSONds,array[i])
        i++;
        }
    
    }else{
        array=undefined;
        }
        
return array;
