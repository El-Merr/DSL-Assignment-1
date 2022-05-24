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
	if(true) { //(computer(Id id, list[COMPONENT] comps, list[Id], list[Id] ids) := ast) {
		return checkLabelUniqueness();
	} else 
		 throw "That is not a computer";
}

private bool checkLabelUniqueness() {
	return false;
}

private bool checkStorageSize() {
	return false;
}

private bool checkDisplayType() {
	return false;
}

private bool checkDuplicateComponents() {
	return false;
}

private bool checkTypes() {
	return false;
}
