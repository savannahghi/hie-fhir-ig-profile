Instance: HIEMedication-example
InstanceOf: HIEMedication
Usage: #example
Title: "Example HIE Medication"
Description: "Amoxicillin 500 mg oral capsule, active, with ingredient strength, manufacturer, and batch"

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Medication Summary</b></p><table><tbody><tr><td><b>Name</b></td><td>Amoxicillin 500 mg capsule</td></tr><tr><td><b>Status</b></td><td>active</td></tr><tr><td><b>Form</b></td><td>Capsule</td></tr><tr><td><b>Identifier</b></td><td>AMOX-500-CAP-30</td></tr><tr><td><b>Amount</b></td><td>30 capsules per package</td></tr><tr><td><b>Ingredient</b></td><td>Amoxicillin, 500 mg per capsule</td></tr><tr><td><b>Manufacturer</b></td><td>Acme Generics Ltd</td></tr><tr><td><b>Batch</b></td><td>LOT-AXC-2025-001, exp 2027-01-31</td></tr></tbody></table></div>"

* identifier[0].use = #official
* identifier[0].system = "http://formulary.example.org/meds"
* identifier[0].value = "AMOX-500-CAP-30"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #ACSN
* identifier[0].type.coding[0].display = "Accession ID"

* code.coding[0].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* code.coding[0].code = #308189
* code.coding[0].display = "Amoxicillin 500 MG Oral Capsule"
* code.text = "Amoxicillin 500 mg capsule"

* status = #active

* manufacturer.reference = "Organization/manu-001"
* manufacturer.display = "Acme Generics Ltd"

* form.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm"
* form.coding[0].code = #CAP
* form.coding[0].display = "Capsule"

* amount.numerator.value = 30
* amount.numerator.unit = "capsule"
* amount.numerator.system = "http://unitsofmeasure.org"
* amount.numerator.code = #1
* amount.denominator.value = 1
* amount.denominator.unit = "package"
* amount.denominator.system = "http://unitsofmeasure.org"
* amount.denominator.code = #1

* ingredient[0].itemCodeableConcept.coding[0].system = "http://snomed.info/sct"
* ingredient[0].itemCodeableConcept.coding[0].code = #372687004
* ingredient[0].itemCodeableConcept.coding[0].display = "Amoxicillin (substance)"
* ingredient[0].isActive = true
* ingredient[0].strength.numerator.value = 500
* ingredient[0].strength.numerator.unit = "mg"
* ingredient[0].strength.numerator.system = "http://unitsofmeasure.org"
* ingredient[0].strength.numerator.code = #mg
* ingredient[0].strength.denominator.value = 1
* ingredient[0].strength.denominator.unit = "capsule"
* ingredient[0].strength.denominator.system = "http://unitsofmeasure.org"
* ingredient[0].strength.denominator.code = #1

* batch.lotNumber = "LOT-AXC-2025-001"
* batch.expirationDate = "2027-01-31"
