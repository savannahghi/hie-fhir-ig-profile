Invariant: hie-md-has-when
Description: "Provide whenPrepared or whenHandedOver"
Severity: #warning
Expression: "whenPrepared.exists() or whenHandedOver.exists()"

Profile: HIEMedicationDispense
Parent: MedicationDispense
Id: hie-medicationdispense
Title: "HIE MedicationDispense"
Description: "R4B MedicationDispense for HIE fulfillment. Focus on status, medication, subject, authorship, quantity, daysSupply, timing, performer, prescription linkage, and substitution."
* ^status = #active

* ^language = #en
* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE MedicationDispense</b></p>
  <p>Dispensing record for e-prescribing and HIE exchanges. Requires status, medication, subject, and fulfillment details. Links to the originating prescription and supports substitution documentation.</p>
  <ul>
    <li>Must Support: status, medication[x], subject, authorizingPrescription, quantity, daysSupply, whenPrepared or whenHandedOver, performer.actor</li>
    <li>Bindings: status (required), category (extensible), substitution.type (extensible), substitution.reason (extensible)</li>
    <li>References: subject → HIEPatient, authorizingPrescription → HIEMedicationRequest, performer.actor → HIEOrganization or clinical actors</li>
  </ul>
</div>
"""

* insert SharedIdentifierRules
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* status 1..1 MS
* statusReasonCodeableConcept	only HIECodeableConcept
* statusReasonReference ^type.profile = Canonical(HIEReference)

* category 1..1 MS
* category only HIECodeableConcept

* medication[x] 1..1 MS
* medicationCodeableConcept only HIECodeableConcept
* medicationReference only Reference(HIEMedication)
* medicationReference ^type.profile = Canonical(HIEReference)

* subject 1..1 MS
* subject only Reference(HIEPatient)
* subject ^type.profile = Canonical(HIEReference)

* context 1..1
* context only Reference(HIEEncounter or HIEEpisodeOfCare)
* context ^type.profile = Canonical(HIEReference)

* supportingInformation ^type.profile = Canonical(HIEReference)

* performer 1..* MS
* performer.function only HIECodeableConcept
* performer.actor 1..1 MS
* performer.actor only Reference(HIEPractitioner or HIEPractitionerRole or HIEOrganization or HIEPatient or Device or RelatedPerson)
* performer.actor ^type.profile = Canonical(HIEReference)

* location ^type.profile = Canonical(HIEReference)
* destination ^type.profile = Canonical(HIEReference)

* receiver 1..*
* receiver only Reference(HIEPatient or HIEPractitioner)
* receiver ^type.profile = Canonical(HIEReference)

* authorizingPrescription 1..* MS
* authorizingPrescription only Reference(HIEMedicationRequest)
* authorizingPrescription ^type.profile = Canonical(HIEReference)

* type only HIECodeableConcept

* quantity 0..1 MS
* daysSupply 0..1 MS

* whenPrepared 0..1
* whenHandedOver 0..1
* obeys hie-md-has-when

* dosageInstruction 1..* MS

* substitution 0..1
* substitution.type 1..1
* substitution.type only HIECodeableConcept
* substitution.reason only HIECodeableConcept
* substitution.responsibleParty 1..*
* substitution.responsibleParty only Reference(HIEPractitioner or HIEPractitionerRole)
* substitution.responsibleParty ^type.profile = Canonical(HIEReference)

* note only HIEAnnotation

* detectedIssue ^type.profile = Canonical(HIEReference)
* eventHistory ^type.profile = Canonical(HIEReference)
