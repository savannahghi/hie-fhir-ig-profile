Instance: ExampleKenyaObservation
InstanceOf: HIEObservation
Title: "Example Kenya Observation"
Description: "Example instance conforming to the HIEObservation profile"

* identifier[0].system = "http://khie.health.go.ke/identifiers/observations"
* identifier[0].value = "OBS-123456789"
* identifier[0].type = #PLAC
* identifier[0].use = #official
* basedOn[0].reference = "ServiceRequest/servreq-001"

* category[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category[0].coding[0].code = #vital-signs
* category[0].coding[0].display = "Vital Signs"
* status = #registered
* code = #100002-5
* subject.reference = "Patient/pat-001"

* encounter.reference = "Encounter/enc-001"

* effectiveDateTime = "2025-02-14T10:30:00+03:00"

* issued = "2025-02-14T10:32:00+03:00"

* valueQuantity.value = 120
* valueQuantity.unit = "mmHg"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mm[Hg]

* performer[0].reference = "HIEPractitioner/prac-001"

* interpretation[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
* interpretation[0].coding[0].code = #H
* interpretation[0].coding[0].display = "High"

* hasMember[0].reference = "Observation/diastolic-example"

* component[0].code.coding[0].system = "http://loinc.org"
* component[0].code.coding[0].code = #8462-4
* component[0].code.coding[0].display = "Diastolic blood pressure"

* component[0].valueQuantity.value = 80
* component[0].valueQuantity.unit = "mmHg"
* component[0].valueQuantity.system = "http://unitsofmeasure.org"
* component[0].valueQuantity.code = #mm[Hg]

* component[0].interpretation[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
* component[0].interpretation[0].coding[0].code = #N
* component[0].interpretation[0].coding[0].display = "Normal"

* component[1].code.coding[0].system = "http://loinc.org"
* component[1].code.coding[0].code = #8480-6
* component[1].code.coding[0].display = "Systolic blood pressure"

* component[1].dataAbsentReason.coding[0].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* component[1].dataAbsentReason.coding[0].code = #not-performed
* component[1].dataAbsentReason.coding[0].display = "Not Performed"
