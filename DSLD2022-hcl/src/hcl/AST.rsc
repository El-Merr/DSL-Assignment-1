module hcl::AST

/*
 * Define the Abstract Syntax for HCL
 *
 * - make sure there is an almost one-to-one correspondence with the grammar in Syntax.rsc
 */
 public data COMPUTER = computer(int Id, list[COMPONENT] comps);
 public data COMPONENT = 
 	storage(STORAGEPROP sProp)
 	| proccessing(PROCCESSINGPROP pProp)
 	| display(DISPLAYPROP dProp);
 	
 public data STORAGEPROP = StorageTypeSize(STORAGETYPE sType, int Int);
 public data STORAGETYPE = hdd() | ssd();
 
 public data PROCCESSINGPROP = 
 	cores(int Int)
 	| speed(int Int)
 	| L1(int Int, PROCCESSINGLTYPE pLType)
 	| l2(int Int, PROCCESSINGLTYPE pLType)
 	| l3(int Int, PROCCESSINGLTYPE pLType);
 public data PROCCESSINGLTYPE = kib() | mib();
 
 public data DISPLAYPROP = 
 	diagonal(int Int)
 	| dType(DISPLAYTYPE disType);
 public data DISPLAYTYPE = 
 	hd()
 	| fullhd() 
 	| vierk()
 	| vijfk();
 
 anno loc COMPUTR@location;
 anno loc COMPONENT@location;
 anno loc STORAGEPROP@location;
 anno loc STORAGETYPE@location;
 anno loc PROCCESSINGPROP@location;
 anno loc PROCCESSINGLTYPE@location;
 anno loc DISPLAYPROP@location;
 anno loc DISPLAYTYPE@location;