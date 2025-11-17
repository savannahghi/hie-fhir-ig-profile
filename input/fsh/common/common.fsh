Profile: HIEHumanName
Parent: HumanName
Id: hie-human-name
Title: "HIE HumanName"
Description: "A specialized human name data type with stricter cardinalities."
* family 1..1
* given 1..*
* use 1..1
* text 1..1

Profile: HIEContactPoint
Parent: ContactPoint
Id: hie-contact-point
Title: "HIE ContactPoint"
Description: "A custom contact point with stricter cardinality"
* system 1..1
* value 1..1