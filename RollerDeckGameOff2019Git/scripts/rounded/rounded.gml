var n = argument[0];
var d = 0;
if(argument_count == 2) d = argument[1];
return round(n * power(10, d)) / power(10, d);