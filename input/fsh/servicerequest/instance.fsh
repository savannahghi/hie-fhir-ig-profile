Instance: HIEServiceRequest-example
InstanceOf: HIEServiceRequest
Usage: #example
Title: "Example HIE ServiceRequest"
Description: "Outpatient lab order for Complete Blood Count, fasting serum sample"

* text.status = #generated
* text.div = """<div xmlns="http://www.w3.org/1999/xhtml"><p><b>ServiceRequest Summary</b></p><table><tbody><tr><td><b>Status</b></td><td>active</td></tr><tr><td><b>Intent</b></td><td>order</td></tr><tr><td><b>Priority</b></td><td>routine</td></tr><tr><td><b>Category</b></td><td>Laboratory test</td></tr><tr><td><b>Code</b></td><td>Complete blood count panel (LOINC 57021-8)</td></tr><tr><td><b>Subject</b></td><td>Jane Patient (Patient/p-001)</td></tr><tr><td><b>Encounter</b></td><td>OP visit 2025-11-15 (Encounter/enc-001)</td></tr><tr><td><b>When</b></td><td>2025-11-16T08:00:00+03:00</td></tr><tr><td><b>Requester</b></td><td>Dr. John Clinician (Practitioner/pr-001)</td></tr><tr><td><b>Performer</b></td><td>Acme Diagnostics Lab (Organization/lab-001)</td></tr></tbody></table><p><b>Order Details</b></p><ul><li>Fasting required</li><li>Serum specimen</li></ul><p><b>Reason</b></p><ul><li>Condition: Fatigue (Condition/cond-001)</li></ul><p><b>Specimen &amp; Location</b></p><ul><li>Collect at Outpatient Lab Room 3 (Location/loc-lab)</li><li>Specimen: Specimen/spec-001</li></ul><p><b>Notes</b></p><ul><li>Patient instructed to fast for 8 hours prior to collection.</li></ul></div>"""

* identifier[0].use = #official
* identifier[0].system = "http://hospital.example.org/ordernumbers"
* identifier[0].value = "ORD-2025-000123"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #PLAC
* identifier[0].type.coding[0].display = "Placer Identifier"

* status = #active
* intent = #order
* priority = #routine

* category.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0074"
* category.coding[0].code = #LAB
* category.coding[0].display = "Laboratory"
* code.coding[0].system = "http://loinc.org"
* code.coding[0].code = #57021-8
* code.coding[0].display = "CBC W Auto Differential panel"

* orderDetail[0].coding[0].system = "http://snomed.info/sct"
* orderDetail[0].coding[0].code = #422512005
* orderDetail[0].coding[0].display = "Fasting procedure requested"
* orderDetail[1].coding[0].system = "http://snomed.info/sct"
* orderDetail[1].coding[0].code = #119361006
* orderDetail[1].coding[0].display = "Serum specimen"

* subject.reference = "Patient/p-001"
* subject.display = "Jane Patient"
* encounter.reference = "Encounter/enc-001"
* encounter.display = "OP visit 2025-11-15"

* occurrenceDateTime = "2025-11-16T08:00:00+03:00"
* authoredOn = "2025-11-15T10:12:00+03:00"

* requester.reference = "Practitioner/pr-001"
* requester.display = "Dr. John Clinician"
* performerType.coding[0].system = "http://terminology.hl7.org/CodeSystem/participant-role"
* performerType.coding[0].code = #performer
* performerType.coding[0].display = "Performer"
* performer[0].reference = "Organization/lab-001"
* performer[0].display = "Acme Diagnostics Lab"

* locationReference[0].reference = "Location/loc-lab"
* locationReference[0].display = "Outpatient Lab Room 3"

* reasonReference[0].reference = "Condition/cond-001"
* reasonReference[0].display = "Fatigue"

* bodySite[0].coding[0].system = "http://snomed.info/sct"
* bodySite[0].coding[0].code = #368208006
* bodySite[0].coding[0].display = "Left antecubital fossa"

* specimen[0].reference = "Specimen/spec-001"
* specimen[0].display = "Serum sample"

* supportingInfo[0].reference = "DocumentReference/dr-001"
* supportingInfo[0].display = "Referral letter"
* replaces[0].reference = "ServiceRequest/sr-older-001"
* replaces[0].display = "Supersedes prior non-fasting order"

* note[0].authorReference = Reference(Practitioner/pr-001)
* note[0].time = "2025-11-15T10:15:00+03:00"
* note[0].text = "Patient advised to fast 8 hours. Collect before 10 AM."
