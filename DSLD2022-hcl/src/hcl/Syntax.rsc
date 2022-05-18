module hcl::Syntax

/*
 * Define a concrete syntax for HCL. The langauge's specification is available in the PDF (Section 3)
 */

start syntax Program = "begin" Stat* "end" ;

syntax Statement 
= "if" Expression "then" Stat* "else" Stat* "fi" 
| Id ":=" Expression 
| "while" Expression "do" Stat* "od" ; 

syntax Expression 
= Id 
| "(" Expression ")" 
| left Expression "*" Expression 
> left Expression "+" Expression ; 

lexical Id = [A-Za-z][A-Za-z0-9\-]*; 

layout Whitespace = [\ \t\n\r]*;

