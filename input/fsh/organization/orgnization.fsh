Profile: KenyaOrganizationR4B
Parent: Organization
Id: kenya-organization-r4b
Title: "Kenya Organization R4B"
Description: "Organiztion profile for R4B with shared core rules"
* ^version = "0.1.0-r4b"
* ^status = #active
* insert SharedIdentifierRules
* identifier.use from http://hl7.org/fhir/ValueSet/identifier-use%7C4.0.1 (required)
* identifier.type from KenyaOrganiztionR4BIdentifiersVs (required)
* type MS
* name 1..
* telecom 1.. MS
* address MS
* contact MS 
* address.use from http://hl7.org/fhir/ValueSet/address-use%7C4.0.1 (required)
