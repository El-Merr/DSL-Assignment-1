module hcl::CST2AST

import hcl::AST;
import hcl::Syntax;
import hcl::Parser;

/*
 * Implement a mapping from concrete syntax trees (CSTs) to abstract syntax trees (ASTs)
 * Hint: Use switch to do case distinction with concrete patterns
 * Map regular CST arguments (e.g., *, +, ?) to lists
 * Map lexical nodes to Rascal primitive types (bool, int, str)
 */
 
public COMPUTER loadComputer(loc text) = load(parseHCL(text)); // should this be (COMPUTER) abstr or Computer (conc)

public COMPUTER load((Computer) `computer <Id id> { <Component comp>* } { <Id ids>* }`) = 
	computer(loadId(id), [loadComponent(c) | c <- comp], [loadId(i) | i <- ids]);
	
// Case distinction on components
public COMPONENT loadComponent(Component c) {
	switch (c) {
		case (Component) `storage <Id id> { <StorageProp p>* } `: return storage(loadStorageProp(p));
	}
	return load(c);
} 

// StorageProp
public STORAGEPROP loadStorageProp(StorageProp p) {
	return load((StorageProp) `storage <StorageType t> <Int i>`) = StorageTypeSize(loadStorageType(t), loadInt(i));
}

// StorageType
public STORAGETYPE loadStorageType(t) {
	switch (t) {
		case "HDD": return hdd();
		case "SSD": return ssd(); 
	}
	return hdd(); //default
}

// Map lexial Id to str
public str loadId(Id id) {
	return id;
}

// Map lexial Int to int
public int loadInt(Int i) {
	return i;
}

// Map lexial Real to real
public real loadReal(Real i) {
	return i;
}

// top level function to start conversion
public COMPUTER cst2ast(&T parseTree) {
	return loadComputer(parseTree);
}