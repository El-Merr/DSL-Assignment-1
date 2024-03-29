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
		return checkStorageSize(label, comps)
		&& checkLabelUniqueness(label, comps)
		&& checkLSize(label, comps)
		&& checkDisplayType(label, comps);
	} else throw "Not a computer";
}

private bool checkStorageSize(HclId label, list[COMPONENT] comps) {
	// each drive between 32 and 1024 gb and total between 0 and 8192 gb
	int total = 0;
	for ( c <- comps) {
		switch (c) {
			case storage(HclId label, list[STORAGEPROP] sProps): {
				for ( sp <- sProps) {
					if (storageTypeSize(STORAGETYPE sType, int size) := sp) {
						total += size;
						if (32 < size || size > 1024) return false;
					}
				};
			}
			default: continue;
		}
	}
	
	return total <= 8192;
} 

private bool checkLabelUniqueness(HclId label, list[COMPONENT] comps) {
 	// for each label in ast return notEqual
 	HclId slabel = "";
 	HclId plabel = "";	
 	HclId dlabel = "";
 	HclId clabel = "";
 	for (c <- comps) {
		switch (c) {
			case storage(HclId l, list[STORAGEPROP] sProps): slabel = l;
			case processing(HclId l, list[PROCESSINGPROP] pProps): plabel = l;
			case display(HclId l, list[DISPLAYPROP] dProps): dlabel = l;
			case HclId l: clabel = l;
			default: return false;
		}
	}
	// needs a null check, this will now break
	list[HclId] labels = [slabel, plabel, dlabel];
	return slabel != plabel
	&& slabel != dlabel 
	&& slabel != label
	&& plabel != dlabel
	&& plabel != label
	&& dlabel != label
	&& clabel in labels;
}

private bool checkLSize(HclId label, List[COMPONENT] comps) {
	list[int] sizes = [];
	for (c <- comps) {
		if ( processing(HclId label, list[PROCESSINGPROP] pProps) := c) {
			for ( p <- props) {
				switch (p) {
					case l1(int Int, PROCESSINGLTYPE pLType): {
						// add size to array in MiB
						sizes[1] = (pLType == "MiB") ? Int : Int * 1000;
						// check if cache is larger then its maximum size
						if (!(pLType == "MiB") ? Int < 0.128 : Int < 128) return false;
					}
					case l2(int Int, PROCESSINGLTYPE pLType): {
						sizes[2] = (pLType == "MiB") ? Int : Int * 1000;
						if (!(pLType == "MiB") ? Int < 8 : Int < 8000) return false;
					}
					case l3(int Int, PROCESSINGLTYPE pLType): {
						sizes[3] = (pLType == "MiB") ? Int : Int * 1000;
						if (!(pLType == "MiB") ? Int < 32 : Int < 32000) return false;
					}
					default: continue;
				}
			}
		}
	}
	// check if it satisfies L1 < L2 < L3
	return sizes[1] < sizes[2] && sizes[2] < sizes[3];
}

private bool checkDisplayType(HclId label, list[COMPONENT] comps) {
	for (c <- comps) {
		if (display(HclId l, list[DISPLAYPROP] props) := c) {
			for (p <- props) {
				if (dType(DISPLAYTYPE d) := p) {
					switch (d)  {
						case "HD": return true;
						case "Full-HD": return true;
						case "4K": return true;
						case "5K": return true;
						default: return false;
					}
				}
			}
		}
	}
	return false;	
}

private bool checkDuplicateComponents() {
	return true;
}

// only support Booleans, integers, reals and strings
private bool checkTypes() {
	return false;
}
