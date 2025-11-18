// Profile
Profile: HIEPatient
Parent: Patient
Id: hie-patient
Title: "HIE Patient"
Description: "R4B Patient constrained for HIE workflows."
* ^status = #active

// Minimal narrative
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
      <tr><td><b>General practitioner</b></td><td>Dr. John Clinician (Practitioner/pr-001)</td></tr>
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
""" (exactly)

* active 1..1 MS
* gender 0..1 MS
* gender from $administrative-gender (required)
* birthDate 0..1 MS

* insert SharedIdentifierRules
* identifier 1..* MS
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

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
* generalPractitioner only Reference(Practitioner or PractitionerRole or HIEOrganization)
* generalPractitioner ^type.profile = Canonical(HIEReference)

* managingOrganization 1..1 MS
* managingOrganization only Reference(HIEOrganization)
* managingOrganization ^type.profile = Canonical(HIEReference)

* link 0..*
* link.other only Reference(HIEPatient)
* link.other ^type.profile = Canonical(HIEReference)