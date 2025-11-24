Profile: HIEPatient
Parent: Patient
Id: hie-patient
Title: "HIE Patient"
Description: "R4B Patient constrained for HIE workflows."
* ^status = #active

* ^text.status = #generated
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>HIE Patient</b></p><p>Patient profile for HIE workflows. Focus on identifiers, demographics, telecom, contacts, communication, managing organization, and GP.</p></div>"

* text.status = #generated
* active 1..1 MS
* gender 1..1
* gender from $administrative-gender (required)
* birthDate 0..1 MS

* identifier 1..*
* insert SharedIdentifierRules
* identifier.type from HIEPersonIdentifierTypes (required)

* name 1..1 MS
* name only HIEHumanName

* telecom 0..* MS
* telecom only HIEContactPoint

* maritalStatus 0..1 MS
* maritalStatus only HIECodeableConcept
* maritalStatus from $marital-status (extensible)

* contact 0..* MS
  * relationship 1..* MS
  * relationship only HIECodeableConcept
  * relationship from $patient-contact-relationship (extensible)
  * name 0..1
  * telecom 1..*
  * telecom only HIEContactPoint
  * organization only Reference(HIEOrganization)
  * organization ^type.profile = Canonical(HIEReference)

* communication 0..* MS
  * language 1..1 MS
  * language only HIECodeableConcept
  * language from $common-languages (extensible)

* generalPractitioner 0..* MS
* generalPractitioner only Reference(HIEPractitioner or PractitionerRole or HIEOrganization)
* generalPractitioner ^type.profile = Canonical(HIEReference)

* managingOrganization 1..1 MS
* managingOrganization only Reference(HIEOrganization)
* managingOrganization ^type.profile = Canonical(HIEReference)

* link 0..*
* link.other only Reference(HIEPatient)
* link.other ^type.profile = Canonical(HIEReference)