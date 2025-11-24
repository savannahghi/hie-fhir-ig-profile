Instance: HIEPatient-example
InstanceOf: HIEPatient
Usage: #example
Title: "Example HIE Patient"
Description: "R4B patient record for HIE workflows"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>Patient Summary</b></p>
  <table>
    <tbody>
      <tr><td><b>Name</b></td><td>Jane Patient</td></tr>
      <tr><td><b>Identifier</b></td><td>MRN-12345 (http://example.org/mrn)</td></tr>
      <tr><td><b>Active</b></td><td>true</td></tr>
      <tr><td><b>Gender</b></td><td>female</td></tr>
      <tr><td><b>Date of birth</b></td><td>1990-04-05</td></tr>
      <tr><td><b>Marital status</b></td><td>Married</td></tr>
      <tr><td><b>Managing organization</b></td><td>Acme Health Center (Organization/org-001)</td></tr>
      <tr><td><b>General practitioner</b></td><td>Dr. John Clinician (HIEPractitioner/pr-001)</td></tr>
    </tbody>
  </table>
  <p><b>Telecom</b></p>
  <ul>
    <li>Phone, mobile, rank 1: +254700000001</li>
    <li>Email, home: jane.patient@example.org</li>
  </ul>
  <p><b>Contacts</b></p>
  <table>
    <thead>
      <tr><th align="left">Name</th><th align="left">Relationship</th><th align="left">Telecom</th><th align="left">Organization</th></tr>
    </thead>
    <tbody>
      <tr><td>Mary Patient</td><td>Mother</td><td>+254700000002 (mobile)</td><td>Acme Health Center (Organization/org-001)</td></tr>
    </tbody>
  </table>
  <p><b>Communication</b></p>
  <ul>
    <li>Language: English, preferred</li>
  </ul>
  <p><b>Links</b></p>
  <ul>
    <li>Refer: Patient/p-duplicate-001 (Duplicate index record)</li>
  </ul>
</div>
"""

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

* generalPractitioner[0].reference = "HIEPractitioner/pr-001"
* generalPractitioner[0].display = "Dr. John Clinician"

* managingOrganization.reference = "Organization/org-001"
* managingOrganization.display = "Acme Health Center"

* link[0].other.reference = "Patient/p-duplicate-001"
* link[0].other.display = "Duplicate index record"
* link[0].type = #refer