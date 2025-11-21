Instance: HIEMedicationRequest-example
InstanceOf: HIEMedicationRequest
Usage: #example
Title: "Example HIE MedicationRequest"
Description: "E-prescription for Amoxicillin 500 mg capsules, outpatient treatment for acute otitis media"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>MedicationRequest Summary</b></p>
  <table>
    <tbody>
      <tr><td><b>Status</b></td><td>active</td></tr>
      <tr><td><b>Intent</b></td><td>order</td></tr>
      <tr><td><b>Priority</b></td><td>routine</td></tr>
      <tr><td><b>Medication</b></td><td>Amoxicillin 500 mg capsule</td></tr>
      <tr><td><b>Subject</b></td><td>Jane Patient (Patient/p-001)</td></tr>
      <tr><td><b>Encounter</b></td><td>Ambulatory visit (Encounter/enc-001)</td></tr>
      <tr><td><b>Authored</b></td><td>2025-11-16T10:05:00+03:00</td></tr>
      <tr><td><b>Requester</b></td><td>Dr. John Clinician (Practitioner/pr-001)</td></tr>
      <tr><td><b>Performer</b></td><td>Acme Community Pharmacy (Organization/pharm-001)</td></tr>
    </tbody>
  </table>

  <p><b>Dosage</b></p>
  <ul>
    <li>500 mg, oral, every 8 hours, for 7 days</li>
  </ul>

  <p><b>Dispense</b></p>
  <ul>
    <li>Quantity: 21 capsules, 7 days supply, no repeats</li>
    <li>Performer: Acme Community Pharmacy</li>
  </ul>

  <p><b>Reason</b></p>
  <ul>
    <li>Condition: Acute otitis media (Condition/cond-001)</li>
  </ul>

  <p><b>Coverage</b></p>
  <ul>
    <li>Primary coverage (Coverage/cov-001)</li>
  </ul>

  <p><b>Notes</b></p>
  <ul>
    <li>Take with water. Stop if rash or breathing difficulty.</li>
  </ul>
</div>
"""

// Identifier
* identifier[0].use = #official
* identifier[0].system = "http://hospital.example.org/medrx"
* identifier[0].value = "RX-2025-000567"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #PLAC
* identifier[0].type.coding[0].display = "Placer Identifier"

// Administrative
* status = #active
* intent = #order
* category[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/medicationrequest-category"
* category[0].coding[0].code = #outpatient
* category[0].coding[0].display = "Outpatient"
* priority = #routine

// Medication (CodeableConcept form)
* medicationCodeableConcept.coding[0].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* medicationCodeableConcept.coding[0].code = #723
* medicationCodeableConcept.coding[0].display = "Amoxicillin 500 MG Oral Capsule"
* medicationCodeableConcept.text = "Amoxicillin 500 mg capsule"

// Subject and context
* subject.reference = "Patient/p-001"
* subject.display = "Jane Patient"
* encounter.reference = "Encounter/enc-001"
* encounter.display = "Ambulatory visit for ear pain"

// Authorship
* authoredOn = "2025-11-16T10:05:00+03:00"
* requester.reference = "Practitioner/pr-001"
* requester.display = "Dr. John Clinician"
* performer.reference = "Organization/pharm-001"
* performer.display = "Acme Community Pharmacy"
* performerType.coding[0].system = "http://terminology.hl7.org/CodeSystem/participant-role"
* performerType.coding[0].code = #performer
* performerType.coding[0].display = "Performer"
* recorder.reference = "Practitioner/pr-001"
* recorder.display = "Dr. John Clinician"

// Reasons
* reasonReference[0].reference = "Condition/cond-001"
* reasonReference[0].display = "Acute otitis media"

// Insurance
* insurance[0].reference = "Coverage/cov-001"
* insurance[0].display = "Primary PPO coverage"

// DosageInstruction (at least one required)
* dosageInstruction[0].sequence = 1
* dosageInstruction[0].text = "Take 1 capsule by mouth every 8 hours for 7 days"
* dosageInstruction[0].timing.repeat.frequency = 3
* dosageInstruction[0].timing.repeat.period = 1
* dosageInstruction[0].timing.repeat.periodUnit = #d
* dosageInstruction[0].route.coding[0].system = "http://snomed.info/sct"
* dosageInstruction[0].route.coding[0].code = #26643006
* dosageInstruction[0].route.coding[0].display = "Oral route"
* dosageInstruction[0].doseAndRate[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/dose-rate-type"
* dosageInstruction[0].doseAndRate[0].type.coding[0].code = #ordered
* dosageInstruction[0].doseAndRate[0].doseQuantity.value = 500
* dosageInstruction[0].doseAndRate[0].doseQuantity.unit = "mg"
* dosageInstruction[0].doseAndRate[0].doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction[0].doseAndRate[0].doseQuantity.code = #mg
* dosageInstruction[0].asNeededBoolean = false
* dosageInstruction[0].additionalInstruction[0].text = "Take with water"

// DispenseRequest (required)
* dispenseRequest.numberOfRepeatsAllowed = 0
* dispenseRequest.quantity.value = 21
* dispenseRequest.quantity.unit = "capsule"
* dispenseRequest.quantity.system = "http://unitsofmeasure.org"
* dispenseRequest.quantity.code = #1
* dispenseRequest.expectedSupplyDuration.value = 7
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org"
* dispenseRequest.expectedSupplyDuration.code = #d
* dispenseRequest.performer.reference = "Organization/pharm-001"
* dispenseRequest.performer.display = "Acme Community Pharmacy"

// Substitution
* substitution.allowedBoolean = true
* substitution.reason.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActReason"
* substitution.reason.coding[0].code = #CT
* substitution.reason.coding[0].display = "Cost"

// Note (HIEAnnotation pattern: author + time + text)
* note[0].authorReference = Reference(Practitioner/pr-001)
* note[0].time = "2025-11-16T10:06:00+03:00"
* note[0].text = "Counsel patient about allergy signs. Stop and seek care if rash or dyspnea."
