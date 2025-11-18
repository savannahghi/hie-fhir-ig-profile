Instance: HIEPatient-example
InstanceOf: HIEPatient
Usage: #example
Title: "Example HIE Patient"
Description: "R4B patient record for HIE workflows"

* text.status = #generated

* active = true
* gender = #female
* birthDate = "1990-04-05"

* identifier[0].use = #official
* identifier[0].system = "http://example.org/mrn"
* identifier[0].value = "MRN-12345"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #MR
* identifier[0].type.coding[0].display = "Medical record number"

* name.use = #official
* name.family = "Patient"
* name.given[0] = "Jane"
* name.text = "Jane Patient"

* telecom[0].system = #phone
* telecom[0].value = "+254700000001"
* telecom[0].use = #mobile
* telecom[0].rank = 1
* telecom[1].system = #email
* telecom[1].value = "jane.patient@example.org"
* telecom[1].use = #home

* maritalStatus.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus"
* maritalStatus.coding[0].code = #M
* maritalStatus.coding[0].display = "Married"

* contact[0].relationship[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* contact[0].relationship[0].coding[0].code = #MTH
* contact[0].relationship[0].coding[0].display = "Mother"
* contact[0].name.text = "Mary Patient"
* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+254700000002"
* contact[0].telecom[0].use = #mobile
* contact[0].organization.reference = "Organization/org-001"
* contact[0].organization.display = "Acme Health Center"

* communication[0].language.coding[0].system = "urn:ietf:bcp:47"
* communication[0].language.coding[0].code = #en
* communication[0].language.coding[0].display = "English"
* communication[0].preferred = true

* generalPractitioner[0].reference = "Practitioner/pr-001"
* generalPractitioner[0].display = "Dr. John Clinician"

* managingOrganization.reference = "Organization/org-001"
* managingOrganization.display = "Acme Health Center"

* link[0].other.reference = "Patient/p-duplicate-001"
* link[0].other.display = "Duplicate index record"
* link[0].type = #refer