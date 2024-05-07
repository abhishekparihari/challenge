"""
We have a nested object. We would like a function where you pass in the object and a key and get back the value.  
The choice of language and implementation is up to you. 
 
Example Inputs 
object = {“a”:{“b”:{“c”:”d”}}} , key = a/b/c 
object = {“x”:{“y”:{“z”:”a”}}} , key = x/y/z 
value = a 
"""

#function
def get_value(object, key):
    key_list = key.split('/')
    current_value = object
    
    for key in key_list:
        current_value = current_value[key]
    return current_value


#Example Inputs 

object = {"a": {"b": {"c": "d"}}}
key = "a/b/c"
print(get_value(object, key))  
# Output: d

object = {"x": {"y": {"z": "a"}}}
key = "x/y/z"
print(get_value(object, key))  
# Output: a
