Instance: HIEMedicationDispense-example
InstanceOf: HIEMedicationDispense
Usage: #example
Title: "Example HIE MedicationDispense"
Description: "Dispense of amoxicillin 500 mg capsules, completed, no substitution"

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>MedicationDispense Summary</b></p><table><tbody><tr><td><b>Status</b></td><td>completed</td></tr><tr><td><b>Category</b></td><td>Outpatient</td></tr><tr><td><b>Medication</b></td><td>Amoxicillin 500 mg capsule</td></tr><tr><td><b>Subject</b></td><td>Jane Patient (Patient/p-001)</td></tr><tr><td><b>Context</b></td><td>Encounter/enc-001</td></tr><tr><td><b>Quantity</b></td><td>30 {capsule}</td></tr><tr><td><b>Days supply</b></td><td>10 d</td></tr><tr><td><b>When prepared</b></td><td>2025-11-16T09:10:00+03:00</td></tr><tr><td><b>When handed over</b></td><td>2025-11-16T09:20:00+03:00</td></tr><tr><td><b>Performer</b></td><td>Acme Community Pharmacy (Organization/pharm-001)</td></tr><tr><td><b>Authorizing prescription</b></td><td>MedicationRequest/mr-001</td></tr></tbody></table><p><b>Dosage</b></p><ul><li>Take 1 capsule by mouth every 8 hours for 10 days</li></ul><p><b>Receiver</b></p><ul><li>Patient received medication at counter</li></ul><p><b>Notes</b></p><ul><li>Counselled on adherence and GI upset advice</li></ul></div>"

* identifier[0].use = #official
* identifier[0].system = "http://pharmacy.example.org/dispenses"
* identifier[0].value = "DISP-2025-000045"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #ACSN
* identifier[0].type.coding[0].display = "Accession ID"

* status = #completed
* category.coding[0].system = "http://terminology.hl7.org/CodeSystem/medicationdispense-category"
* category.coding[0].code = #outpatient
* category.coding[0].display = "Outpatient"

* medicationCodeableConcept.coding[0].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* medicationCodeableConcept.coding[0].code = #308189
* medicationCodeableConcept.coding[0].display = "Amoxicillin 500 MG Oral Capsule"

* subject.reference = "Patient/p-001"
* subject.display = "Jane Patient"

* context.reference = "Encounter/enc-001"
* context.display = "OP visit 2025-11-16"

* performer[0].function.coding[0].system = "http://terminology.hl7.org/CodeSystem/medicationdispense-performer-function"
* performer[0].function.coding[0].code = #packager
* performer[0].function.coding[0].display = "Packager"
* performer[0].actor.reference = "Organization/pharm-001"
* performer[0].actor.display = "Acme Community Pharmacy"

* receiver[0].reference = "Patient/p-001"
* receiver[0].display = "Jane Patient"

* authorizingPrescription[0].reference = "MedicationRequest/mr-001"
* authorizingPrescription[0].display = "Amoxicillin 500 mg TID x10d"

* quantity.value = 30
* quantity.unit = "capsule"
* quantity.system = "http://unitsofmeasure.org"
* quantity.code = #{capsule}

* daysSupply.value = 10
* daysSupply.unit = "day"
* daysSupply.system = "http://unitsofmeasure.org"
* daysSupply.code = #d

* whenPrepared = "2025-11-16T09:10:00+03:00"
* whenHandedOver = "2025-11-16T09:20:00+03:00"

* dosageInstruction[0].text = "Take 1 capsule by mouth every 8 hours for 10 days"
* dosageInstruction[0].timing.repeat.frequency = 3
* dosageInstruction[0].timing.repeat.period = 1
* dosageInstruction[0].timing.repeat.periodUnit = #d
* dosageInstruction[0].route.coding[0].system = "http://snomed.info/sct"
* dosageInstruction[0].route.coding[0].code = #26643006
* dosageInstruction[0].route.coding[0].display = "Oral route"
* dosageInstruction[0].doseAndRate[0].doseQuantity.value = 1
* dosageInstruction[0].doseAndRate[0].doseQuantity.unit = "capsule"
* dosageInstruction[0].doseAndRate[0].doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction[0].doseAndRate[0].doseQuantity.code = #{capsule}

* substitution.wasSubstituted = false
* substitution.type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActSubstanceAdminSubstitutionCode"
* substitution.type.coding[0].code = #E
* substitution.type.coding[0].display = "equivalent"
* substitution.responsibleParty[0].reference = "Practitioner/pr-001"
* substitution.responsibleParty[0].display = "Dr. John Clinician"

* note[0].authorReference = Reference(Practitioner/pr-001)
* note[0].time = "2025-11-16T09:22:00+03:00"
* note[0].text = "Patient counselled on adherence and to take with food if GI upset occurs."