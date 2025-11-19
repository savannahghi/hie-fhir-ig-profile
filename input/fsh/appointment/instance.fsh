Instance: HIEAppointment-example
InstanceOf: HIEAppointment
Usage: #example
Title: "Example HIE Appointment"
Description: "Booked outpatient consultation, 30 minutes, with participant roles and clinical reason"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>Appointment</b></p>
  <p>Booked outpatient consultation for headache. Duration 30 minutes. Patient and clinician confirmed. Linked to the originating service request and clinical condition.</p>
  <table>
    <thead>
      <tr><th align="left">Field</th><th align="left">Value</th></tr>
    </thead>
    <tbody>
      <tr><td>Status</td><td>booked</td></tr>
      <tr><td>Start</td><td>2025-11-20T09:00:00+03:00</td></tr>
      <tr><td>End</td><td>2025-11-20T09:30:00+03:00</td></tr>
      <tr><td>Minutes</td><td>30</td></tr>
      <tr><td>Service Category</td><td>Ambulatory care</td></tr>
      <tr><td>Service Type</td><td>General practice consult</td></tr>
      <tr><td>Reason</td><td>Headache (SNOMED 25064002)</td></tr>
      <tr><td>Subject</td><td>Jane Patient (Patient/p-001)</td></tr>
      <tr><td>Performer</td><td>Dr. John Clinician (Practitioner/pr-001)</td></tr>
      <tr><td>Location</td><td>Outpatient Room 3 (Location/loc-OPD)</td></tr>
    </tbody>
  </table>
</div>
"""

* identifier[0].use = #official
* identifier[0].system = "http://example.org/appointments"
* identifier[0].value = "APT-2025-0001"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #ACSN
* identifier[0].type.coding[0].display = "Accession ID"

* status = #booked

* start = "2025-11-20T09:00:00+03:00"
* end = "2025-11-20T09:30:00+03:00"
* minutesDuration = 30

* appointmentType.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0276"
* appointmentType.coding[0].code = #ROUTINE
* appointmentType.coding[0].display = "Routine"

* priority = 5

* serviceCategory[0].coding[0].system = "http://example.org/fhir/CodeSystem/service-category"
* serviceCategory[0].coding[0].code = #AMB
* serviceCategory[0].coding[0].display = "Ambulatory care"

* serviceType[0].coding[0].system = "http://example.org/fhir/CodeSystem/service-type"
* serviceType[0].coding[0].code = #GP
* serviceType[0].coding[0].display = "General practice consult"

* specialty[0].coding[0].system = "http://snomed.info/sct"
* specialty[0].coding[0].code = #394814009
* specialty[0].coding[0].display = "General practice"

* reasonCode[0].coding[0].system = "http://snomed.info/sct"
* reasonCode[0].coding[0].code = #25064002
* reasonCode[0].coding[0].display = "Headache"

* reasonReference[0].reference = "Condition/cond-001"
* reasonReference[0].display = "Acute headache"

* basedOn[0].reference = "ServiceRequest/sr-001"
* basedOn[0].display = "Consultation request"

* slot[0].reference = "Slot/slot-001"
* slot[0].display = "Clinic slot 9:00–9:30 AM"

* created = "2025-11-18T14:05:00+03:00"
* description = "Outpatient consultation with GP for headache evaluation"

* participant[0].type[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/participant-type"
* participant[0].type[0].coding[0].code = #SBJ
* participant[0].type[0].coding[0].display = "subject"
* participant[0].actor.reference = "Patient/p-001"
* participant[0].actor.display = "Jane Patient"
* participant[0].status = #accepted

* participant[1].type[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/participant-type"
* participant[1].type[0].coding[0].code = #PPRF
* participant[1].type[0].coding[0].display = "primary performer"
* participant[1].actor.reference = "Practitioner/pr-001"
* participant[1].actor.display = "Dr. John Clinician"
* participant[1].status = #accepted

* participant[2].type[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/participant-type"
* participant[2].type[0].coding[0].code = #LOC
* participant[2].type[0].coding[0].display = "location"
* participant[2].actor.reference = "Location/loc-OPD"
* participant[2].actor.display = "Outpatient Room 3"
* participant[2].status = #accepted

* participant[3].type[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/participant-type"
* participant[3].type[0].coding[0].code = #PART
* participant[3].type[0].coding[0].display = "participation"
* participant[3].actor.reference = "HealthcareService/hs-gp"
* participant[3].actor.display = "General Practice Service"
* participant[3].status = #accepted
