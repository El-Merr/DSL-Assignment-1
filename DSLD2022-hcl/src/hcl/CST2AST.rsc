module hcl::CST2AST

import hcl::AST;
import hcl::Syntax;

/*
 * Implement a mapping from concrete syntax trees (CSTs) to abstract syntax trees (ASTs)
 * Hint: Use switch to do case distinction with concrete patterns
 * Map regular CST arguments (e.g., *, +, ?) to lists
 * Map lexical nodes to Rascal primitive types (bool, int, str)
 */
import ParseTree;	// wss moeten we dit zelf doen :(
 
  public Computer cst2ast(&T parsetree) = implode(#Computer, parsetree); 