// Encounter Invariants
Invariant: hie-enc-reason-present
Description: "Provide at least one reasonCode or reasonReference"
Severity: #error
Expression: "reasonCode.exists() or reasonReference.exists()"

Invariant: hie-enc-participant-has-actor
Description: "Participant must reference an actor when type is present"
Severity: #error
Expression: "participant.where(type.exists()).all(individual.exists())"

// Encounter Profile
Profile: HIEEncounter
Parent: Encounter
Id: hie-encounter
Title: "HIE Encounter"
Description: "An interaction between a patient and healthcare providers to deliver services or assess health status."
* ^status = #active
* insert SharedIdentifierRules
* identifier MS
* identifier.use from $identifier-use (required)

* ^language = #en
* ^text.status = #generated
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>HIE Encounter</b></p><p>Constrained Encounter for interoperable workflows. Focus on status, class, type, subject, participants, reasons, episode of care, service provider, basedOn, period, and locations</p></div>"

* status 1..1 MS

* priority 0..1 MS
* priority from $v3-ActPriority (required)
* priority only HIECodeableConcept

* class 1..1 MS
* class from $encounter-class (required)

* type MS
* type only HIECodeableConcept

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^type.profile = Canonical(HIEReference)

* appointment 0..* MS
* appointment only Reference(Appointment)
* appointment ^type.profile = Canonical(HIEReference)

* episodeOfCare 1..* MS
* episodeOfCare only Reference(HIEEpisodeOfCare)
* episodeOfCare ^type.profile = Canonical(HIEReference)

* serviceProvider 1..1 MS
* serviceProvider only Reference(HIEOrganization)
* serviceProvider ^type.profile = Canonical(HIEReference)

* basedOn 0..* MS
* basedOn only Reference(ServiceRequest)
* basedOn ^type.profile = Canonical(HIEReference)

* partOf 0..1
* partOf only Reference(HIEEncounter)
* partOf ^type.profile = Canonical(HIEReference)

* reasonCode 0..* MS
* reasonCode only HIECodeableConcept

* reasonReference 0..*
* reasonReference only Reference(Condition or Procedure or Observation)
* reasonReference ^type.profile = Canonical(HIEReference)

* participant 1..* MS
* participant.type 0..* MS
* participant.type only HIECodeableConcept
* participant.individual 0..1 MS
* participant.individual only Reference(HIEPractitioner or PractitionerRole or RelatedPerson)
* participant.individual ^type.profile = Canonical(HIEReference)

* diagnosis 0..* MS
* diagnosis.condition 1..1 MS
* diagnosis.condition only Reference(Condition or Procedure)
* diagnosis.condition ^type.profile = Canonical(HIEReference)
* diagnosis.use 0..1
* diagnosis.use only HIECodeableConcept
* diagnosis.use from $diagnosis-role (preferred)

* hospitalization 0..1 MS
* hospitalization.origin 0..1
* hospitalization.origin only Reference(Location or HIEOrganization)
* hospitalization.origin ^type.profile = Canonical(HIEReference)
* hospitalization.admitSource 0..1
* hospitalization.admitSource only HIECodeableConcept
* hospitalization.reAdmission 0..1
* hospitalization.reAdmission only HIECodeableConcept
* hospitalization.dietPreference 0..* 
* hospitalization.dietPreference only HIECodeableConcept
* hospitalization.specialCourtesy 0..*
* hospitalization.specialCourtesy only HIECodeableConcept
* hospitalization.specialArrangement 0..*
* hospitalization.specialArrangement only HIECodeableConcept
* hospitalization.destination 0..1
* hospitalization.destination only Reference(Location or HIEOrganization)
* hospitalization.destination ^type.profile = Canonical(HIEReference)
* hospitalization.dischargeDisposition 0..1
* hospitalization.dischargeDisposition only HIECodeableConcept

* location MS
* location.location 1..1 MS
* location.location only Reference(Location)
* location.location ^type.profile = Canonical(HIEReference)

// Apply invariants
* obeys hie-enc-reason-present
* obeys hie-enc-participant-has-actor
