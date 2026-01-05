Instance: ExampleHIEComposition
InstanceOf: HIEComposition
Title: "Example HIE Composition"
Description: "Example instance of HIE Composition for testing."

* identifier.system = "http://example.org/hie/compositions"
* identifier.value = "comp-12345"
* identifier.use = #official
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #ACSN
* identifier[0].type.coding[0].display = "Accession ID"

* status = #final
* type = http://loinc.org#11502-2 "Narrative document"

* category = http://loinc.org#LP173421-1 "Clinical document"

* subject = Reference(Patient/example)
* encounter = Reference(Encounter/example)
* author = Reference(Organization/example)
* date = "2024-11-01T10:00:00Z"
* title = "Composition Title"
* confidentiality = #N  
* attester[0].mode = #legal
* attester[0].time = "2024-11-01T10:00:00Z"
* attester[0].party = Reference(Practitioner/example)

* custodian = Reference(Organization/example)

* event.detail = Reference(Procedure/example)
* event.code = http://loinc.org#XYZ "Event Code Placeholder"

* section[0].title = "Clinical Summary"
* section[0].code = http://loinc.org#34133-9 "Summary of episode note"
* section[0].author = Reference(Practitioner/example)
* section[0].entry[0] = Reference(Observation/example)
