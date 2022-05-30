module hcl::Syntax

/*
 * Define a concrete syntax for HCL. The langauge's specification is available in the PDF (Section 3)
 */
	
// Start of program
start syntax Computer =
	computerComp: "computer" Id i "{" {Component ","}* {Id ","}* "}";

layout Whitespace = [\ \t\n\r]*;

// id labels must start with lowercase letter, but can contain upper cases, numbers and underscores
lexical Id = [a-z][a-zA-Z0-9_]*;

// positive integers
lexical Int = [0-9]+;

// positive real values with optionally one point followed by numbers
lexical Real = [0-9]+ ([.][0-9]+)?;

// Components
syntax Component =
	storage: "storage" Id i "{" { StorageProp "," }* "}"
	| processing: "processing" Id i "{" {ProcessingProp "," }* "}"
	| display: "display" Id i "{" {DisplayProp "," }* "}" ;
	

// Properties
syntax StorageProp =
	storageTypeSize: "storage" ":" StorageType "of" Int int "GiB"; // TODO: restrict size range
	
syntax ProcessingProp =
	cores: "cores" ":" Int int
	| speed: "speed" ":" Real value "Ghz"
	| L1: "L1" ":" Int i ProcessingLType
	| L2: "L2" ":" Int i ProcessingLType
	| L3: "L3" ":" Int i ProcessingLType;
	
syntax DisplayProp =
	diagonal: "diagonal" ":" Real r "inch"
	| dType: "type" ":" DisplayType;


// Types	
syntax StorageType = "HDD" | "SSD";
	
//syntax StorageSize = ; // range from 32 to 1024 GB

syntax ProcessingLType = "KiB" | "MiB";

syntax DisplayType = "HD" | "Full-HD" | "4K" | "5K";







	