Profile: HIEPractitioner
Parent: Practitioner
Id: hie-practitioner
Title: "HIE Practitioner"
Description: "R4B Practitioner constrained for HIE directories and clinical attribution. Focus on identifiers, name, telecom, gender, qualifications, and communication."
* ^status = #active

* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE Practitioner</b></p>
  <p>Directory and clinical actor profile for exchange across organizations. Emphasizes stable identifiers, human-readable names, contact points, and qualifications to support scheduling, attribution, and provenance.</p>
  <ul>
    <li>Must Support: identifier, active, name, telecom, gender, qualification.code, communication</li>
    <li>Bindings: gender (required), communication (extensible)</li>
    <li>References: qualification.issuer → HIEOrganization</li>
  </ul>
</div>
"""

* active 1..1 MS

* insert SharedIdentifierRules
* identifier 1..* MS
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* name 1..* MS
* name only HIEHumanName

* telecom 1..* MS
* telecom only HIEContactPoint


* gender 1..1 MS
* gender from $administrative-gender (required)

* birthDate 0..1

* qualification 1..* MS
* qualification.identifier 1..*
* qualification.code only HIECodeableConcept
* qualification.issuer 1..1
* qualification.issuer only Reference(HIEOrganization)
* qualification.issuer ^type.profile = Canonical(HIEReference)

* communication only HIECodeableConcept
