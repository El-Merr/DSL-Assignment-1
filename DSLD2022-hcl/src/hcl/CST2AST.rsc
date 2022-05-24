module hcl::CST2AST

import hcl::AST;
import hcl::Syntax;

/*
 * Implement a mapping from concrete syntax trees (CSTs) to abstract syntax trees (ASTs)
 * Hint: Use switch to do case distinction with concrete patterns
 * Map regular CST arguments (e.g., *, +, ?) to lists
 * Map lexical nodes to Rascal primitive types (bool, int, str)
 */
// import ParseTree;	// wss moeten we dit zelf doen :(
 
public COMPUTER cst2ast(&T parsetree) {
	switch(parsetree) {
		// Computer
		case (Computer) `computer <Id id> { <Component c>* }`: return computer(id, toList(c));
		
		// Components
		//case <Component c>: COMPONENT;
		//
		//// Properties
		//case <StorageProp s>: STORAGEPROP;
		//case <ProcessingProp p>: PROCESSINGPROP;
		//case <DisplayProp d>: DISPLAYPROP;
		//
		//// Property Types
		//case <StorageType s>: STORAGETYPE;
		//case <ProcessingType p>: PROCESSINGTYPE;
		//case <DisplayType d>: DISPLAYTYPE;
		//
		//// Value Types
		//case <Int i>: toInt("<i>");
		//case <Real r>: toReal("<r>");
		//case <Id i>: toString("<i>");
	
	}
}

public list toList(&T items) {
	for ( item in items) list.push(cst2ast(item))
	return list;
}