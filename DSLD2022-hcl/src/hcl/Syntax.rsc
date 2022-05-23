module hcl::Syntax

/*
 * Define a concrete syntax for HCL. The langauge's specification is available in the PDF (Section 3)
 */

start syntax Program = 
	program: "computer" decl Id id "{" {Declaration ","}* "}";
	
syntax Stat 
	= "if" Exp "then" Stat* "else" Stat* "fi" 
	| Id ":=" Exp 
	| "while" Exp "do" Stat* "od" ; 

syntax Exp 
	= Id 
	| "(" Exp ")" 
	| left Exp "*" Exp 
	> left Exp "+" Exp ; 

lexical Id
	= ([a-zA-Z] !<< // look behind restriction
	[a-zA-Z][a-zA-Z0-9_]* // character classes
	!>> [a-zA-Z0-9_]) // lookahead restriction
	\ Reserved; // subtract keywords
	
layout Whitespace = [\ \t\n\r]*;

syntax Declarations =
	"declare" {Declaration ","}* decls ";" ;

syntax Declaration = decl: Id id ":" Type tp ;

syntax Type =
	storage: "storage"
	| processing: "processing"
	| display: "display" ;

syntax Storage =
	storage: "storage" decl Id id "{" { StorProp "," }* "{" ;
	
syntax StorProp =
	storage: "storage: SSD of" Int int "Gib";
	
syntax ProcProp =
	cores: Int int
	| speed: "speed:" Int int "Ghz"
	| L1: "L1:" Int int "Ghz"
	| L2: "L2:" Int int "MiB"
	| L3: "L3:" Int int "MiB";
	
syntax DispProp =
	diagonal: "diagonal:" Int int "inch"
	| dType: "type:" Int int "K";