Profile: HIEAppointmentResponse
Parent: AppointmentResponse
Id: hie-appointmentresponse
Title: "HIE AppointmentResponse"
Description: "R4B AppointmentResponse constrained for HIE scheduling responses, requiring clear linkage to the appointment, a well-typed actor, and a participant status."
* ^status = #active

* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE AppointmentResponse</b></p>
  <p>Response to an appointment proposal or booking. Emphasizes appointment linkage, the responding actor, status, optional comments, and timing signals.</p>
  <ul>
    <li>Must Support: appointment, actor, participantStatus</li>
    <li>Timing: start/end, or occurrenceDateTime, or requestedPeriod</li>
    <li>References: appointment → HIEAppointment, actor → Patient, HIEPractitioner, RelatedPerson, Device, HealthcareService, Location</li>
  </ul>
</div>
"""

* insert SharedIdentifierRules
* identifier 1..* MS
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* appointment 1..1 MS
* appointment only Reference(HIEAppointment)
* appointment ^type.profile = Canonical(HIEReference)

* actor 1..1 MS
* actor only Reference(HIEPatient or HIEPractitioner or RelatedPerson or Device or HealthcareService or Location)
* actor ^type.profile = Canonical(HIEReference)

* participantStatus 1..1 MS

* participantType 0..*
* participantType only HIECodeableConcept

* start 1..1
* end 1..1

* comment 0..1