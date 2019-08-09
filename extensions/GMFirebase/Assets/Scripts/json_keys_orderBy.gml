#define json_keys_orderBy
///json_keys_orderBy(JSON String,key) [return array or undefined]

var keys,order,orderI,value,finish,temp_val;

keys=json_keys(argument0)
order=argument1

if keys!=undefined{
    orderI=0;
    repeat(array_length_1d(keys)){
        value[orderI]=json_read(argument0,keys[orderI],order)
        //show_message(value[orderI])
        if (is_undefined(value[orderI]) || string_char_at(value[orderI],0)=='{'){
            value[orderI]='0'
            }
        orderI++;
        }
    
    finish=false
    orderI=0;
    while(!finish){
        if (compare_string(value[orderI],value[orderI+1])==-1){
            temp_val=value[orderI]
            value[orderI]=value[orderI+1]
            value[orderI+1]=temp_val
            
            temp_val=keys[orderI]
            keys[orderI]=keys[orderI+1]
            keys[orderI+1]=temp_val
            
            orderI=0;
            }else
                {
                orderI++;
                }
        if orderI+1==array_length_1d(value){
            finish=true;
            break;
            }
        }
        
    
    }

return keys;


#define compare_string
//compare_string(string,string) [retrun real]
var compI,retorno,charA,charB;

retorno=0;
compI=1;
repeat(min(string_length(argument0),string_length(argument1))+1){
    
    charA=string_lower(string_char_at(argument0,compI))
    charB=string_lower(string_char_at(argument1,compI))
    
    charA=ord(charA)
    charB=ord(charB)
    
    if charA<charB{retorno=1;break;}
    if charA>charB{retorno=-1;break;}
    compI++;
    }
    
//show_message(argument0+' -- '+argument1+' // '+string(retorno))
return retorno;