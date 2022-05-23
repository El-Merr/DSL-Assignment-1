module hcl::Syntax

/*
 * Define a concrete syntax for HCL. The langauge's specification is available in the PDF (Section 3)
 */

	
// Start
start syntax Computer =
	computer: "computer" decl Id id "{" {Component ","}* "}";

lexical Id
	= ([a-zA-Z] !<< // look behind restriction
	[a-zA-Z][a-zA-Z0-9_]* // character classes
	!>> [a-zA-Z0-9_]);
	
layout Whitespace = [\ \t\n\r]*;

lexical Int = [0-9]*;

// Components
syntax Component =
	storage: "storage" decl Id id "{" { StorageProp "," }* "}"
	| proccessing: "processing" decl Id id "{" {ProccessingProp "," }* "}"
	| display: "display" decl Id id "{" {DisplayProp "," }* "}" ;
	
// Properties
syntax StorageProp =
	storageTypeSize: "storage:" StorageType "of" decl Int int "Gib";
	
syntax ProccessingProp =
	cores: "cores:" decl Int int
	| speed: "speed:" decl Int int "Ghz"
	| L1: "L1:" decl Int int ProccessingLType
	| L2: "L2:" decl Int int ProccessingLType
	| L3: "L3:" decl Int int ProccessingLType;
	
syntax DisplayProp =
	diagonal: "diagonal:" Int int "inch"
	| dType: "type:" DisplayType;

// Types	
syntax StorageType = 
	hdd: "HDD"
	| ssd: "SSD";
	
//syntax StorageSize = ; // range from 32 to 1024 GB

syntax ProccessingLType = "KiB" | "MiB";

syntax DisplayType = "HD" | "Full-HD" | "4K" | "5K";







	