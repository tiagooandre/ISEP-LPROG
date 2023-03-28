// Define a grammar called Hello

grammar Hello; 

inicio : 'hello' ID ; // match keyword hello followed by an identifieri

ID : [a-z]+ ; // match lower-case identifiers

WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines
