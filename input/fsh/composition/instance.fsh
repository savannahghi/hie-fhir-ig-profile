Profile: HIEComposition
Parent: Composition
Id: hie-composition
Title: "HIE Composition"
Description: "This represents the logical grouping of related clinical information within HIE"
* insert SharedIdentifierRules
* category MS
* subject 1..
* encounter 1..
* confidentiality MS
* attester 1.. 
  * time 1..
  * party 1.. 
* custodian 1..
* event MS
  * detail 1..
  * code 1..
* section 1.. 
  * code 1..
  * code from http://loinc.org
  * author 1..
  * entry 1..
