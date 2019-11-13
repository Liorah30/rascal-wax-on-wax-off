module Series2

import ParseTree;
import IO;

/*
 * Syntax definition
 * - define a grammar for JSON (https://json.org/)
 */
 
start syntax JSON
  = Object;
  
syntax Object
  = ;
  
syntax Value
  = String
  | Number
  | Array
  | Object
  | Boolean
  | Null
  ;

syntax Null
  = ;
  
syntax Boolean
  = ;  
  
syntax Array
  = ;  
  
lexical String
  = [\"] ![\"]* [\"]; // slightly simplified
  
lexical Number
  = ;  
  
  

// import the module in the console
start[JSON] example() 
  = parse(#start[JSON], 
          "{
          '  \"age\": 42, 
          '  \"name\": \"Joe\",
          '  \"address\": {
          '     \"street\": \"Wallstreet\",
          '     \"number\": 102
          '  }
          '}");    
  


// use visit/deep match to find all property names
// - use concrete pattern matching
// - use "<x>" to convert a String x to str
set[str] propNames(start[JSON] json) {

}


// define a recursive transformation mapping JSON to map[str,value] 
// - use the module ValueIO to parse strings into Rascal values
// - define a data type for representing null;

map[str, value] json2map(start[JSON] json) = json2map(json.top);

map[str, value] json2map((JSON)`<Object obj>`)  = m
  when map[str, value] m := json2value((Value)`<Object obj>`);

value json2value(Value v) {

}

test bool example2map() = json2map(example()) == (
  "age": 42,
  "name": "Joe",
  "address" : (
     "street" : "Wallstreet",
     "number" : 102
  )
);

 
  
/*
 * Optionally: do this tutorial to get more familiarized with concrete syntax
 * by extending Javascript with new language features:
 *   https://github.com/cwi-swat/hack-your-javascript
 */  
  