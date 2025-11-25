Profile: HIEPractitionerRole
Parent: PractitionerRole
Id: hie-practitionerrole
Title: "HIE PractitionerRole"
Description: "R4B PractitionerRole for HIE directories, scheduling, and attribution. Emphasizes identifiers, practitioner, organization, role codes, specialties, service locations, telecom, and availability."
* ^status = #active

* ^language = #en
* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE PractitionerRole</b></p>
  <p>Directory entry that connects a practitioner to an organization with role, specialty, locations, services, contact points, and availability. Supports scheduling, referrals, and provenance.</p>
  <ul>
    <li>Must Support: identifier, active, practitioner, organization, code, specialty, location, telecom</li>
    <li>Availability: availableTime and notAvailable modeled for booking and triage</li>
    <li>References: practitioner → HIEPractitioner, organization → HIEOrganization, location → Location, healthcareService → HealthcareService, endpoint → Endpoint</li>
  </ul>
</div>
"""

* active 1..1 MS

* insert SharedIdentifierRules
* identifier 1..* MS
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* practitioner 1..1 MS
* practitioner only Reference(HIEPractitioner)
* practitioner ^type.profile = Canonical(HIEReference)

* organization 1..1 MS
* organization only Reference(HIEOrganization)
* organization ^type.profile = Canonical(HIEReference)

* code 1..* MS
* code only HIECodeableConcept   // Bind to local TS

* specialty 1..* MS
* specialty only HIECodeableConcept   // Bind to local TS

* location 0..* MS
* location only Reference(Location)
* location ^type.profile = Canonical(HIEReference)

* healthcareService 1..*
* healthcareService only Reference(HealthcareService)
* healthcareService ^type.profile = Canonical(HIEReference)

* telecom 1..* MS
* telecom only HIEContactPoint

* availableTime 1..*
* availableTime.daysOfWeek 0..*
* availableTime.allDay 0..1
* availableTime.availableStartTime 0..1
* availableTime.availableEndTime 0..1

* notAvailable 1..*
* notAvailable.description 1..1
* notAvailable.during 0..1

* endpoint ^type.profile = Canonical(HIEReference)