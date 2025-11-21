Alias: $mr-status = http://hl7.org/fhir/ValueSet/medicationrequest-status
Alias: $mr-intent = http://hl7.org/fhir/ValueSet/medicationrequest-intent
Alias: $mr-category = http://hl7.org/fhir/ValueSet/medicationrequest-category
Alias: $req-priority = http://hl7.org/fhir/ValueSet/request-priority

Invariant: hie-mr-has-dosage-or-dispense
Description: "Provide at least one dosageInstruction or a dispenseRequest"
Severity: #error
Expression: "dosageInstruction.exists() or dispenseRequest.exists()"

Profile: HIEMedicationRequest
Parent: MedicationRequest
Id: hie-medication-request
Title: "HIE MedicationRequest"
Description: "R4B MedicationRequest constrained for HIE ordering and e-prescribing. Focus on status, intent, medication, subject, timing, requester, reasons, dosage, dispense, substitution, and coverage."
* ^status = #active

* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE MedicationRequest</b></p>
  <p>Constrained medication order for interoperable exchange across providers, pharmacies, and payers. Emphasizes clear status and intent, well-typed medication, patient linkage, authorship, reasons, dosage, and dispense signals.</p>
  <ul>
    <li>Must Support: status, intent, medication[x], subject, authoredOn, requester, dosageInstruction or dispenseRequest</li>
    <li>Bindings: status (required), intent (required), category (extensible), priority (required)</li>
    <li>References: subject → HIEPatient, encounter → HIEEncounter, requester/performer/recorder → clinical actors, insurance → Coverage</li>
  </ul>
</div>
"""

* insert SharedIdentifierRules
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* status 1..1 MS

* intent 1..1 MS

* category 1..* MS
* category only HIECodeableConcept

* priority 1..1 MS

* medication[x] 1..1 MS
* medicationCodeableConcept only HIECodeableConcept
* medicationReference only Reference(Medication)
* medicationReference ^type.profile = Canonical(HIEReference)

* subject 1..1 MS
* subject only Reference(HIEPatient)
* subject ^type.profile = Canonical(HIEReference)

* encounter 1..1
* encounter only Reference(HIEEncounter)
* encounter ^type.profile = Canonical(HIEReference)

* supportingInformation ^type.profile = Canonical(HIEReference)

* authoredOn 1..1 MS

* requester 1..1 MS
* requester only Reference(HIEPractitioner or HIEPractitionerRole or HIEOrganization or HIEPatient or RelatedPerson or Device)
* requester ^type.profile = Canonical(HIEReference)

* performer 1..1
* performer only Reference(HIEPractitioner or HIEPractitionerRole or HIEOrganization or HIEPatient or Device or RelatedPerson or CareTeam)
* performer ^type.profile = Canonical(HIEReference)

* performerType only HIECodeableConcept

* recorder 1..1
* recorder only Reference(HIEPractitioner or HIEPractitionerRole)
* recorder ^type.profile = Canonical(HIEReference)

* reasonCode only HIECodeableConcept

* reasonReference only Reference(HIECondition or HIEObservation)
* reasonReference ^type.profile = Canonical(HIEReference)

* basedOn only Reference(CarePlan or HIEMedicationRequest or HIEServiceRequest or ImmunizationRecommendation)
* basedOn ^type.profile = Canonical(HIEReference)
* groupIdentifier 0..1

* courseOfTherapyType only HIECodeableConcept

* insurance only Reference(Coverage or HIEClaimResponse)
* insurance ^type.profile = Canonical(HIEReference)

* note only HIEAnnotation

* dosageInstruction 1..* MS

* dispenseRequest 1..1 MS
* dispenseRequest.initialFill 0..1
* dispenseRequest.dispenseInterval 0..1
* dispenseRequest.validityPeriod 0..1
* dispenseRequest.numberOfRepeatsAllowed 0..1
* dispenseRequest.quantity 0..1
* dispenseRequest.expectedSupplyDuration 0..1
* dispenseRequest.performer 0..1
* dispenseRequest.performer only Reference(HIEOrganization)
* dispenseRequest.performer ^type.profile = Canonical(HIEReference)

// Substitution
* substitution 0..1
* substitution.allowedCodeableConcept	only HIECodeableConcept
* substitution.reason 0..1
* substitution.reason only HIECodeableConcept

* priorPrescription only Reference(HIEMedicationRequest)
* priorPrescription ^type.profile = Canonical(HIEReference)

* detectedIssue ^type.profile = Canonical(HIEReference)

* eventHistory ^type.profile = Canonical(HIEReference)