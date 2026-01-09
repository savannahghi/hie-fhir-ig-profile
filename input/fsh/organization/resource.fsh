Profile: HIEOrganization
Parent: Organization
Id: organization
Title: "HIE Organization"
Description: "Organization profile for with shared core rules"
* ^status = #active
* insert SharedIdentifierRules
* identifier.use from $identifier-use (required)
* identifier.type from HIEOrganisationIdentifierType (required)
* type MS
* name 1..
* telecom 1.. MS
* address MS
* contact MS 
* address.use from $address-use (required)
