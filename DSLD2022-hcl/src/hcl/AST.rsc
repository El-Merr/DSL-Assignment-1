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
 	storage(STORAGEPROP sProp)
 	| proccessing(PROCCESSINGPROP pProp)
 	| display(DISPLAYPROP dProp);

// storage 	
 public data STORAGEPROP = StorageTypeSize(STORAGETYPE sType, int Int);
 public data STORAGETYPE = hdd() | ssd();
 
 // processing
 public data PROCCESSINGPROP = 
 	cores(int Int)
 	| speed(real Real)
 	| L1(int Int, PROCCESSINGLTYPE pLType)
 	| l2(int Int, PROCCESSINGLTYPE pLType)
 	| l3(int Int, PROCCESSINGLTYPE pLType);
 public data PROCCESSINGLTYPE = kib() | mib();
 
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
 anno loc PROCCESSINGPROP@location;
 anno loc PROCCESSINGLTYPE@location;
 anno loc DISPLAYPROP@location;
 anno loc DISPLAYTYPE@location;