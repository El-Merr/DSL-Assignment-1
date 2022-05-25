module hcl::Parser

import ParseTree;
import hcl::Syntax;
import IO;

/*
 * Define the parser for the HCL language. The name of the function must be parseHCL.
 * This function receives as a parameter the path of the file to parse represented as a loc, and returns a parse tree that represents the parsed program.
 */
 
 public Computer parseHCL(loc l) = parse(#Computer, l);
 
 // function to check parse tree output
 public void testParse(){
 	println(parseHCL(|project://DSLD2022-hcl/test.hcl|));
 }