RuleSet: SharedPatientRules
* active MS
* identifier MS
* name 1..*
* name.given 1..*
* telecom MS
* gender MS
* birthDate MS
* address MS
* obeys ptn-1

Invariant: ptn-1
Description: "Birth date must be in the past or today"
Severity: #error
Expression: "birthDate <= today()"


RuleSet: SharedIdentifierRules
* identifier 1..
  * type 1..1 MS
  * system 1..1 MS
  * value 1..1 MS
  * assigner MS