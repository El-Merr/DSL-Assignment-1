module hcl::CST2AST

import hcl::AST;
import hcl::Syntax;
import hcl::Parser;
import String;
import List;
import IO;

/*
 * Implement a mapping from concrete syntax trees (CSTs) to abstract syntax trees (ASTs)
 * Hint: Use switch to do case distinction with concrete patterns
 * Map regular CST arguments (e.g., *, +, ?) to lists
 * Map lexical nodes to Rascal primitive types (bool, int, str)
 */

// called in main 

// public COMPUTER loadComputer(loc text) = load(parseHCL(text)); // should this be (COMPUTER) abstr or Computer (conc)

public COMPUTER load((Computer)`computer <Id label> {<{Component","}* comp>}`) {
	return computer("<label>", [loadComponent(c) | c <- comp]);
}
	
// Case distinction on components
public COMPONENT loadComponent(Component c) {
	switch (c) {
		case (Component) `storage <Id label> { <{StorageProp","}* props> }`: return storage("<label>", [loadStorageProp(p) | p <- props]);
		case (Component) `processing <Id label> { <{ProcessingProp","}* props> }`: return processing("<label>", [loadProcessingProp(p) | p <- props ]);
		case (Component) `display <Id label> { <{DisplayProp","}* props> }`: return display("<label>", [loadDisplayProp(p) | p <- props] );
		case (Component) `<Id label>`: return reuseComp("<label>");
		default: throw "component error";
	}
} 

// StorageProp
public STORAGEPROP loadStorageProp(StorageProp p) {
	switch(p) {
		case (StorageProp) `storage: <StorageType t> of <Int i> GiB`: return storageTypeSize(loadStorageType(t), toInt("<i>"));
		default: throw "storage error";	
	}	
}

public STORAGETYPE loadStorageType(StorageType t) {
	switch (t) {
		case (StorageType)`HDD`: return hdd();
		case (StorageType)`SSD`: return ssd(); 
		default: throw "storage type error";
	}
}

// processing
public PROCESSINGPROP loadProcessingProp(ProcessingProp p) {
	switch(p) {
		case (ProcessingProp) `cores: <Int i>`: return cores(toInt("<i>"));
		case (ProcessingProp) `speed: <Real r> Ghz`: return speed(toReal("<r>"));
		case (ProcessingProp) `L1: <Int i> <ProcessingLType t>`: return l1( toInt("<i>"), loadProcessingLType(t)); 
		case (ProcessingProp) `L2: <Int i> <ProcessingLType t>`: return l2( toInt("<i>"), loadProcessingLType(t));
		case (ProcessingProp) `L3: <Int i> <ProcessingLType t>`: return l3( toInt("<i>"), loadProcessingLType(t)); 
		default: throw "processing error";	
	}	
}

public PROCESSINGLTYPE loadProcessingLType(ProcessingLType t) {
	switch (t) {
		case (ProcessingLType)`KiB`: return kib();
		case (ProcessingLType)`MiB`: return mib();
		default: throw "L Type error";
	}
}

// display
public DISPLAYPROP loadDisplayProp(DisplayProp p) {
	switch(p) {
		//case (DisplayProp) `diagonal: <Real r>` : return hdd();
		case (DisplayProp) `diagonal: <Real r> inch`: return diagonal(toReal("<r>"));
		case (DisplayProp) `type: <DisplayType d>`: return dType(loadDisplayType(d));
		default: throw "display prop error";
	}
}

public DISPLAYTYPE loadDisplayType(DisplayType d) {
	switch (d) {
		case (DisplayType)`HD`: return hd();
		case (DisplayType)`Full-HD`: return fullhd();
		case (DisplayType)`4K`: return vierk();
		case (DisplayType)`5K`: return vijfk();
		default: throw "display type error";
	}
}

// top level function to start conversion
public COMPUTER cst2ast(Computer cst) {
	return load(cst);
}