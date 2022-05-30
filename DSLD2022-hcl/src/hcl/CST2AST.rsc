module hcl::CST2AST

import hcl::AST;
import hcl::Syntax;
import hcl::Parser;
//import util::Math;
import String;
import List;

/*
 * Implement a mapping from concrete syntax trees (CSTs) to abstract syntax trees (ASTs)
 * Hint: Use switch to do case distinction with concrete patterns
 * Map regular CST arguments (e.g., *, +, ?) to lists
 * Map lexical nodes to Rascal primitive types (bool, int, str)
 */
 
public COMPUTER loadComputer(loc text) = load(parseHCL(text)); // should this be (COMPUTER) abstr or Computer (conc)

public COMPUTER load((Computer)`<Id label> { <Component* comp> } { <Id* labels> }`) = 
	computerComp(label, [loadComponent(c) | c <- comp], [loadId(i) | i <- labels]);
	
// Case distinction on components
public COMPONENT loadComponent(Component c) {
	switch (c) {
		case (Component) `<Id label> { <StorageProp p>* } `: return storage(loadId(label), loadStorageProp(p));
		default: throw "component error";
	}
} 

// StorageProp
public STORAGEPROP loadStorageProp(StorageProp p) {
	//load((StorageProp) `storage <StorageType t> <Int i>`) = StorageTypeSize(loadStorageType(t), toInt(i);
	switch(p) {
		case (StorageProp) `<StorageType t> <Int i>`: return StorageTypeSize(loadStorageType(t), toInt("<i>"));
		default: throw "storage error";	
	}	
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
public str loadId(Id i) {
	return i;
}

// top level function to start conversion
public COMPUTER cst2ast(&T parseTree) {
	return loadComputer(parseTree);
}