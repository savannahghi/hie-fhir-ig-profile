Instance: HIEPractitioner-example
InstanceOf: HIEPractitioner
Usage: #example
Title: "Example HIE Practitioner"
Description: "Licensed general medical practitioner with directory details"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>Practitioner Summary</b></p>
  <table>
    <tbody>
      <tr><td><b>Name</b></td><td>Dr John Clinician</td></tr>
      <tr><td><b>Status</b></td><td>Active</td></tr>
      <tr><td><b>Gender</b></td><td>Male</td></tr>
      <tr><td><b>Identifiers</b></td><td>Provider: PROV-000123, License: LIC-KE-98765</td></tr>
      <tr><td><b>Telecom</b></td><td>Work phone: +254700000010, Work email: john.clinician@example.org</td></tr>
      <tr><td><b>Qualification</b></td><td>General medical practitioner, issuer: Kenya Medical Practitioners and Dentists Council</td></tr>
      <tr><td><b>Languages</b></td><td>English, Swahili</td></tr>
    </tbody>
  </table>
</div>
"""

* active = true
* gender = #male
* birthDate = "1984-03-12"

* identifier[0].use = #official
* identifier[0].system = "http://example.org/providers"
* identifier[0].value = "PROV-000123"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #PRN
* identifier[0].type.coding[0].display = "Provider number"

* identifier[1].use = #secondary
* identifier[1].system = "http://example.org/licenses"
* identifier[1].value = "LIC-KE-98765"
* identifier[1].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[1].type.coding[0].code = #LN
* identifier[1].type.coding[0].display = "License number"

* name[0].use = #official
* name[0].family = "Clinician"
* name[0].given[0] = "John"
* name[0].prefix[0] = "Dr"
* name[0].text = "Dr John Clinician"

* telecom[0].system = #phone
* telecom[0].value = "+254700000010"
* telecom[0].use = #work
* telecom[0].rank = 1

* telecom[1].system = #email
* telecom[1].value = "john.clinician@example.org"
* telecom[1].use = #work

* qualification[0].identifier[0].system = "http://example.org/registrations"
* qualification[0].identifier[0].value = "MED-REG-123456"
* qualification[0].code.coding[0].system = "http://snomed.info/sct"
* qualification[0].code.coding[0].code = #62247001
* qualification[0].code.coding[0].display = "General medical practitioner"
* qualification[0].period.start = "2015-01-01"
* qualification[0].issuer.reference = "Organization/mc-001"
* qualification[0].issuer.display = "Kenya Medical Practitioners and Dentists Council"

* communication[0].coding[0].system = "urn:ietf:bcp:47"
* communication[0].coding[0].code = #en
* communication[0].coding[0].display = "English"

* communication[1].coding[0].system = "urn:ietf:bcp:47"
* communication[1].coding[0].code = #sw
* communication[1].coding[0].display = "Swahili"
