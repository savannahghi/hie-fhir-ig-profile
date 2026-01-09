Profile: HIEAppointment
Parent: Appointment
Id: appointment
Title: "HIE Appointment"
Description: "R4B Appointment constrained for HIE scheduling, requiring clear status, timing, participants, and reason context."
* ^status = #active

* ^language = #en
* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE Appointment</b></p>
  <p>Scheduling artifact for care delivery across organizations. Focus on status, timing, reason, and well-typed participants to support referral and booking workflows.</p>
  <ul>
    <li>Must Support: status, start, end or minutesDuration, participant, reasonCode</li>
    <li>Bindings: status (required), participant.status (required), appointmentType (extensible), priority (code), serviceType (local TS)</li>
    <li>References: participant.actor → Patient, HIEPractitioner, PractitionerRole, RelatedPerson, Device, Location, HealthcareService, Organization</li>
  </ul>
</div>
"""

* insert SharedIdentifierRules
* identifier 1..* MS
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* status 1..1 MS

* start 1..1 MS
* end 1..1 MS
* minutesDuration 1..1 MS

* appointmentType 0..1
* appointmentType only HIECodeableConcept

* priority 0..1
* priority ^short = "Scheduling priority; consider v3 ActPriority if coded elsewhere"

* serviceCategory 1..* 
* serviceCategory only HIECodeableConcept

* serviceType 0..* MS
* serviceType only HIECodeableConcept // Bind to TS service types

* specialty 0..*
* specialty only HIECodeableConcept

* reasonCode 1..* MS
* reasonCode only HIECodeableConcept

* reasonReference 1..*
* reasonReference only Reference(HIECondition or Procedure or Observation)
* reasonReference ^type.profile = Canonical(HIEReference)

* basedOn 0..*
* basedOn only Reference(ServiceRequest)
* basedOn ^type.profile = Canonical(HIEReference)

* slot 0..*
* slot only Reference(Slot)
* slot ^type.profile = Canonical(HIEReference)

* created 1..1
* description 1..1

* requestedPeriod 0..*

* participant 1..* MS
* participant.type 0..* 
* participant.type only HIECodeableConcept

* participant.actor 0..1 MS
* participant.actor only Reference(
    HIEPatient or HIEPractitioner or PractitionerRole or RelatedPerson or
    Device or Location or HealthcareService
  )
* participant.actor ^type.profile = Canonical(HIEReference)

* participant.status 1..1 MS
