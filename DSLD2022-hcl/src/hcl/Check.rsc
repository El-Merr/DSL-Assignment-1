module hcl::Check

import hcl::AST;

/*
 * -Implement a well-formedness checker for the HCL language. For this you must use the AST. 
 * - Hint: Map regular CST arguments (e.g., *, +, ?) to lists 
 * - Hint: Map lexical nodes to Rascal primitive types (bool, int, str)
 * - Hint: Use switch to do case distinction with concrete patterns
 */

 /*
 * Create a function called checkHardwareConfiguration(...), which is responsible for calling all the required functions that check the program's well-formedness as described in the PDF (Section 3.2.) 
 * This function takes as a parameter the program's AST and returns true if the program is well-formed or false otherwise.
 */
  
/*
* Define a function per each verification defined in the PDF (Section 3.2.)
*/

public bool checkHardwareConfiguration(COMPUTER ast) {
	if (computer(HclId label, list[COMPONENT] comps) := ast) {
		return checkLabelUniqueness(ast)
		&& checkStorageSize(ast)
		&& checkDisplayType(comps)
		&& checkDuplicateComponents()
		&& checkTypes();
	} else return false;
}

private bool checkLabelUniqueness(COMPUTER ast) {
	// for each label in ast return notEqual
	return false;
}

private bool checkStorageSize(COMPUTER ast) {
	// each drive between 32 and 1024 gb and total between 0 and 8192 gb
	
	return false;
}
private bool checkLSize() {
	// for each L1 storage type return L1 < L2 < L3
	return false;
}

private bool checkDisplayType(DISPLAYTYPE d) {
	switch (d)  {
		case "HD": return true;
		case "Full-HD": return true;
		case "4K": return true;
		case "5K": return true;
		default: return false;
	}
	return false;
}

private bool checkDuplicateComponents() {
	return false;
}

// only support Booleans, integers, reals and strings
private bool checkTypes() {
	return false;
}
