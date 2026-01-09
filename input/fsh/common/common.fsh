Profile: HIEHumanName
Parent: HumanName
Id: human-name
Title: "HIE HumanName"
Description: "A specialized human name data type with stricter cardinalities."
* family 1..1 MS
* given 1..* MS
* use 1..1
* text 1..1

Profile: HIEContactPoint
Parent: ContactPoint
Id: contact-point
Title: "HIE ContactPoint"
Description: "A custom contact point with stricter cardinality"
* system 1..1 MS
* value 1..1 MS