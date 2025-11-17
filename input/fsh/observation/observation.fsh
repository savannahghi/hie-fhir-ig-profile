Profile: KenyaObservationR4B
Parent: Observation
Id: kenya-observation
Title: "Kenya R4B Observation"
Description: "Observation is a Kenya HIE representation of Observation FHIR resource to be used within KHIE"
* ^version = "0.1.0-r4b"
* ^status = #active
* insert SharedIdentifierRules
* basedOn MS
* category 1..
* category from http://hl7.org/fhir/ValueSet/observation-category
* subject 1..
* encounter MS
* effective[x] 1..
* value[x] MS
* issued 1..
* performer 1..
* interpretation MS
* hasMember MS
* component MS
* component.value[x] MS
* component.dataAbsentReason MS
* component.interpretation MS