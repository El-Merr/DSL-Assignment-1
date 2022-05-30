module hcl::Parser

import ParseTree;
import hcl::Syntax;
import hcl::AST;
import IO;

import hcl::CST2AST;
/*
 * Define the parser for the HCL language. The name of the function must be parseHCL.
 * This function receives as a parameter the path of the file to parse represented as a loc, and returns a parse tree that represents the parsed program.
 */
 
 public Computer parseHCL(loc l) = parse(#Computer, l);
 
 // function to check parse tree output
 public void testParse(){
 	loc testloc = |project://DSLD2022-hcl/src/hcl/PassingTests/largeComputer.hcl|;
 	Computer parseboom = parseHCL(testloc);
 	COMPUTER aboom = cst2ast(parseboom);
 	// println(parseboom);
 	println(aboom);
 }