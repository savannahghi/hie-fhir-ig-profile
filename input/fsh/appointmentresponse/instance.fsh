Instance: HIEAppointmentResponse-example
InstanceOf: HIEAppointmentResponse
Usage: #example
Title: "Example HIE AppointmentResponse"
Description: "Practitioner accepts a booked appointment window"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>Appointment Response</b></p>
  <p>Primary performer accepted the booking. Confirms a 30 minute window.</p>
  <table>
    <thead>
      <tr><th align="left">Field</th><th align="left">Value</th></tr>
    </thead>
    <tbody>
      <tr><td>Appointment</td><td>HIEAppointment APT-2025-0001</td></tr>
      <tr><td>Actor</td><td>Dr. John Clinician (Practitioner/pr-001)</td></tr>
      <tr><td>Status</td><td>accepted</td></tr>
      <tr><td>Start</td><td>2025-11-20T09:00:00+03:00</td></tr>
      <tr><td>End</td><td>2025-11-20T09:30:00+03:00</td></tr>
      <tr><td>Role</td><td>primary performer</td></tr>
      <tr><td>Comment</td><td>Confirmed, please arrive 10 minutes early</td></tr>
    </tbody>
  </table>
</div>
"""

* identifier[0].use = #official
* identifier[0].system = "http://example.org/appointment-responses"
* identifier[0].value = "APR-2025-0001"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #FILL
* identifier[0].type.coding[0].display = "Filler Identifier"

* appointment.reference = "Appointment/HIEAppointment-example"
* appointment.display = "Booked GP consult"

* actor.reference = "Practitioner/pr-001"
* actor.display = "Dr. John Clinician"

* participantStatus = #accepted

* participantType[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/participant-type"
* participantType[0].coding[0].code = #PPRF
* participantType[0].coding[0].display = "primary performer"

* start = "2025-11-20T09:00:00+03:00"
* end = "2025-11-20T09:30:00+03:00"

* comment = "Confirmed, please arrive 10 minutes early"
