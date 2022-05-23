module hcl::Syntax

/*
 * Define a concrete syntax for HCL. The langauge's specification is available in the PDF (Section 3)
 */

	
// Start
start syntax Program =
	Program: "computer" Id id "{" {Component ","}* "}";

lexical Id = [a-z][a-z0-9_]* !>> [a-z0-9];
	
layout Whitespace = [\ \t\n\r]*;

lexical Int = [0-9.]+;

// Components
syntax Component =
	storage: "storage" Id id "{" { StorageProp "," }* "}"
	| processing: "processing" Id id "{" {ProcessingProp "," }* "}"
	| display: "display" Id id "{" {DisplayProp "," }* "}" ;
	
// Properties
syntax StorageProp =
	storageTypeSize: "storage" ":" StorageType "of" Int int "GiB";
	
syntax ProcessingProp =
	cores: "cores" ":" Int int
	| speed: "speed" ":" Int int "Ghz"
	| L1: "L1" ":" Int int ProcessingLType
	| L2: "L2" ":" Int int ProcessingLType
	| L3: "L3" ":" Int int ProcessingLType;
	
syntax DisplayProp =
	diagonal: "diagonal" ":" Int int "inch"
	| dType: "type" ":" DisplayType;

// Types	
syntax StorageType = "HDD" | "SSD";
	
//syntax StorageSize = ; // range from 32 to 1024 GB

syntax ProcessingLType = "KiB" | "MiB";

syntax DisplayType = "HD" | "Full-HD" | "4K" | "5K";







	