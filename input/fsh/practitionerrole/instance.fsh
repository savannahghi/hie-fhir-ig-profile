Instance: HIEPractitionerRole-example
InstanceOf: HIEPractitionerRole
Usage: #example
Title: "Example HIE PractitionerRole"
Description: "Cardiologist at Acme Health Center, available weekdays"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>PractitionerRole Summary</b></p>
  <p>Dr. John Clinician, Cardiologist at Acme Health Center. Accepting referrals. Weekday availability 09:00 to 17:00, except on scheduled CME.</p>
  <table>
    <tbody>
      <tr><td><b>Practitioner</b></td><td>Practitioner/pr-001 (Dr. John Clinician)</td></tr>
      <tr><td><b>Organization</b></td><td>Organization/org-001 (Acme Health Center)</td></tr>
      <tr><td><b>Role</b></td><td>Doctor</td></tr>
      <tr><td><b>Specialty</b></td><td>Cardiology</td></tr>
      <tr><td><b>Locations</b></td><td>Location/loc-cardiology-1</td></tr>
      <tr><td><b>Services</b></td><td>HealthcareService/hs-cardiology-opd</td></tr>
      <tr><td><b>Telecom</b></td><td>+254700000010, cardiology@acme.example.org</td></tr>
      <tr><td><b>Availability</b></td><td>Mon–Fri, 09:00–17:00</td></tr>
      <tr><td><b>Exceptions</b></td><td>CME 2025-12-05 to 2025-12-06</td></tr>
    </tbody>
  </table>
</div>
"""

* active = true

* identifier[0].use = #official
* identifier[0].system = "http://acme.example.org/dir/roles"
* identifier[0].value = "PRROLE-0001"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #PRN
* identifier[0].type.coding[0].display = "Provider number"

* practitioner.reference = "Practitioner/pr-001"
* practitioner.display = "Dr. John Clinician"

* organization.reference = "Organization/org-001"
* organization.display = "Acme Health Center"

* code[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/practitioner-role"
* code[0].coding[0].code = #doctor
* code[0].coding[0].display = "Doctor"

* specialty[0].coding[0].system = "http://snomed.info/sct"
* specialty[0].coding[0].code = #394579002
* specialty[0].coding[0].display = "Cardiology"

* location[0].reference = "Location/loc-cardiology-1"
* location[0].display = "Cardiology OPD Room 3"

* healthcareService[0].reference = "HealthcareService/hs-cardiology-opd"
* healthcareService[0].display = "Outpatient Cardiology Service"

* telecom[0].system = #phone
* telecom[0].value = "+254700000010"
* telecom[0].use = #work
* telecom[0].rank = 1
* telecom[1].system = #email
* telecom[1].value = "cardiology@acme.example.org"
* telecom[1].use = #work

* availableTime[0].daysOfWeek[0] = #mon
* availableTime[0].daysOfWeek[1] = #tue
* availableTime[0].daysOfWeek[2] = #wed
* availableTime[0].daysOfWeek[3] = #thu
* availableTime[0].daysOfWeek[4] = #fri
* availableTime[0].allDay = false
* availableTime[0].availableStartTime = "09:00:00"
* availableTime[0].availableEndTime = "17:00:00"

* notAvailable[0].description = "CME attendance"
* notAvailable[0].during.start = "2025-12-05"
* notAvailable[0].during.end = "2025-12-06"

* endpoint[0].reference = "Endpoint/ep-fhir-r4"
* endpoint[0].display = "FHIR R4 Endpoint for Scheduling"
