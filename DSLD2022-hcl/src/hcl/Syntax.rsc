module hcl::Syntax

/*
 * Define a concrete syntax for HCL. The langauge's specification is available in the PDF (Section 3)
 */
	
// Start of program
start syntax Computer =
	computer: "computer" Id label "{" {Component ","}* comps "}";

layout Whitespace = [\ \t\n\r]*;

// id labels must start with lowercase letter, but can contain upper cases, numbers and underscores
lexical Id = [a-z][a-zA-Z0-9_]*;

// positive integers
lexical Int = [0-9]+;

// positive real values with optionally one point followed by numbers
lexical Real = [0-9]+ ([.][0-9]+)?;

// Components
syntax Component =
	storage: "storage" Id label "{" { StorageProp "," }* propsS "}"
	| processing: "processing" Id label "{" {ProcessingProp "," }* propsP "}"
	| display: "display" Id label "{" {DisplayProp "," }* propsD "}" ;
	

// Properties
syntax StorageProp =
	storageTypeSize: "storage" ":" StorageType type "of" Int size "GiB"; // TODO: restrict size range
	
syntax ProcessingProp =
	cores: "cores" ":" Int num
	| speed: "speed" ":" Real value "Ghz"
	| L1: "L1" ":" L1Size l1 ProcessingLType
	| L2: "L2" ":" L2Size l2 ProcessingLType
	| L3: "L3" ":" L3Size l3 ProcessingLType;
	
syntax DisplayProp =
	diagonal: "diagonal" ":" Real value "inch"
	| dType: "type" ":" DisplayType dtype;


// Types	
syntax StorageType = "HDD" | "SSD";
	
//syntax StorageSize = ; // range from 32 to 1024 GB

syntax L1Size = Int i;
syntax L2Size = Int i;
syntax L3Size = Int i;

syntax ProcessingLType = "KiB" | "MiB";

syntax DisplayType = "HD" | "Full-HD" | "4K" | "5K";







	