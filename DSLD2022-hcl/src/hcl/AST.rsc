module hcl::AST

/*
 * Define the Abstract Syntax for HCL
 *
 * - make sure there is an almost one-to-one correspondence with the grammar in Syntax.rsc
 */
 
 // alias for id
 public alias Id = str;
 
 // main program
 public data COMPUTER = computer(Id id, list[COMPONENT] comps, list[Id] ids);
 public data COMPONENT = 
 	storage(Id id, STORAGEPROP sProp)
 	| processing(Id id, PROCESSINGPROP pProp)
 	| display(Id id, DISPLAYPROP dProp);

// storage 	
 public data STORAGEPROP = StorageTypeSize(STORAGETYPE sType, int Int);
 public data STORAGETYPE = hdd() | ssd();
 
 // processing
 public data PROCESSINGPROP = 
 	cores(int Int)
 	| speed(real Real)
 	| L1(int Int, PROCESSINGLTYPE pLType)
 	| l2(int Int, PROCESSINGLTYPE pLType)
 	| l3(int Int, PROCESSINGLTYPE pLType);
 public data PROCESSINGLTYPE = kib() | mib();
 
 // display
 public data DISPLAYPROP = 
 	diagonal(real Real)
 	| dType(DISPLAYTYPE disType);
 public data DISPLAYTYPE = 
 	hd()
 	| fullhd() 
 	| vierk()
 	| vijfk();
 
 // eclipse tells me these are deprecated but they work for now
 anno loc COMPUTR@location;
 anno loc COMPONENT@location;
 anno loc STORAGEPROP@location;
 anno loc STORAGETYPE@location;
 anno loc PROCESSINGPROP@location;
 anno loc PROCESSINGLTYPE@location;
 anno loc DISPLAYPROP@location;
 anno loc DISPLAYTYPE@location;