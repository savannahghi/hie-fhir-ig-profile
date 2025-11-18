Instance: ExampleKenyaEpisodeOfCare
InstanceOf: HIEEpisodeOfCare
Title: "Example Kenya EpisodeOfCare"
Description: "Example EpisodeOfCare instance conforming to KenyaEpisodeOfCareR4B profile"

* identifier[0].system = "http://khie.health.go.ke/identifiers/episodeofcare"
* identifier[0].value = "EOC-987654321"
* identifier[0].type = #PLAC
* identifier[0].use = #official
* status = #active

* statusHistory[0].status = #active
* statusHistory[0].period.start = "2025-01-10T09:00:00+03:00"

* type[0].coding[0].system = "http://example.org/fhir/ValueSet/HIEEpisodeOfCareServiceTypesVs"
* type[0].coding[0].code = #outpatient
* type[0].coding[0].display = "Outpatient"

* patient.reference = "Patient/pat-001"

* managingOrganization.reference = "Organization/health-facility-001"

* period.start = "2025-01-10T09:00:00+03:00"

* referralRequest[0].reference = "ServiceRequest/servreq-1001"

* careManager.reference = "Practitioner/prac-001"

* account[0].reference = "Account/acc-001"

* diagnosis[0].condition.reference = "Condition/cond-001"
* diagnosis[0].role.coding[0].system = "http://terminology.hl7.org/CodeSystem/diagnosis-role"
* diagnosis[0].role.coding[0].code = #AD
* diagnosis[0].role.coding[0].display = "Admission diagnosis"
* diagnosis[0].rank = 1
