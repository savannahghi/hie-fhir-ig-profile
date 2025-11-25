Profile: HIEServiceRequest
Parent: ServiceRequest
Id: hie-servicerequest
Title: "HIE ServiceRequest"
Description: "R4B ServiceRequest constrained for HIE ordering and referral. Emphasizes status, intent, code, subject, reasons, timing, requester, performers, and context."
* ^status = #active

* ^language = #en
* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE ServiceRequest</b></p>
  <p>Order or referral request used across organizations. Requires clear status and intent, clinically meaningful code or detailed order, patient linkage, timing, reasons, requester, and optional performers.</p>
  <ul>
    <li>Must Support: status, intent, code or orderDetail, subject, authoredOn, requester, reason (code or reference)</li>
    <li>Context: encounter optional; location, performer, and supportingInfo carry workflow signals</li>
    <li>Results linkage: specimen, bodySite, orderDetail, and code support downstream execution</li>
  </ul>
</div>
"""

* insert SharedIdentifierRules
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* status 1..1 MS

* intent 1..1 MS

* priority 0..1 MS
* priority from http://hl7.org/fhir/ValueSet/request-priority (required)

// Category and code (Bind to local service catalog ValueSet)
* category 1..1 MS
* category only HIECodeableConcept

* code 0..1 MS
* code only HIECodeableConcept


* orderDetail 0..* MS
* orderDetail only HIECodeableConcept

* subject 1..1 MS
* subject only Reference(HIEPatient)
* subject ^type.profile = Canonical(HIEReference)

* encounter 1..1
* encounter only Reference(HIEEncounter)
* encounter ^type.profile = Canonical(HIEReference)

* occurrence[x] 0..1 MS
* asNeeded[x] 0..1
* authoredOn 1..1 MS

* requester 1..1 MS
* requester only Reference(HIEPractitioner or HIEPractitionerRole or HIEOrganization or HIEPatient or RelatedPerson or Device)
* requester ^type.profile = Canonical(HIEReference)

* performerType only HIECodeableConcept

* performer 1..* MS
* performer only Reference(HIEPractitioner or HIEPractitionerRole or HIEOrganization or CareTeam or HealthcareService or HIEPatient or Device or RelatedPerson)
* performer ^type.profile = Canonical(HIEReference)

* locationCode only HIECodeableConcept

* locationReference only Reference(Location)
* locationReference ^type.profile = Canonical(HIEReference)

* reasonCode only HIECodeableConcept

* reasonReference 0..* MS
* reasonReference only Reference(HIECondition or HIEObservation or HIEDiagnosticReport or HIEDocumentReference)
* reasonReference ^type.profile = Canonical(HIEReference)

* bodySite only HIECodeableConcept // Bind to local VS

* specimen only Reference(Specimen)
* specimen ^type.profile = Canonical(HIEReference)

* supportingInfo ^type.profile = Canonical(HIEReference)

* replaces only Reference(HIEServiceRequest)
* replaces ^type.profile = Canonical(HIEReference)

* note only HIEAnnotation