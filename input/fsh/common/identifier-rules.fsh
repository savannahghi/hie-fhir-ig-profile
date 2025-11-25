RuleSet: SharedIdentifierRules
* identifier.type 1..1
* identifier.type only HIECodeableConcept
* identifier.system 1..1
* identifier.use 1..1
* identifier.assigner MS
* identifier.value 1..1 MS
* identifier.assigner only Reference(HIEOrganization)
* identifier.assigner ^type.profile = Canonical(HIEReference)