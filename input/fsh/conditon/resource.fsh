Profile: HIECondition
Parent: Condition
Id: condition
Title: "HIE Condition"
Description: "R4B Condition constrained for HIE capture and exchange."
* ^status = #active

* ^language = #en
* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE Condition</b></p>
  <p>Diagnosis, problem, or health concern with constrained status, code, stage, evidence, and references for HIE workflows.</p>
  <ul>
    <li>Must Support: clinicalStatus, verificationStatus, category, code, subject, recordedDate</li>
    <li>Key bindings: clinicalStatus, verificationStatus, category, severity, bodySite, code</li>
    <li>Stage and evidence structured for decision support and reporting</li>
  </ul>
</div>
"""

* insert SharedIdentifierRules
* identifier 1..* MS
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* clinicalStatus 1..1 MS
* clinicalStatus only HIECodeableConcept
* clinicalStatus from $cond-clinical (required)

* verificationStatus 1..1 MS
* verificationStatus only HIECodeableConcept
* verificationStatus from $cond-ver-status (required)

* category 1..* MS
* category only HIECodeableConcept
* category from $cond-category (required)

* severity 1..1 MS
* severity only HIECodeableConcept
* severity from HIEConditionSeverity (required)

* code 1..1
* code only HIECodeableConcept

* bodySite 0..* 
* bodySite only HIECodeableConcept

* subject 1..1 MS
* subject only Reference(HIEPatient)
* subject ^type.profile = Canonical(HIEReference)

* encounter 1..1
* encounter only Reference(HIEEncounter)
* encounter ^type.profile = Canonical(HIEReference)

* onset[x] 0..1
* abatement[x] 0..1
* recordedDate 1..1 MS

* recorder 0..1
* recorder only Reference(HIEPractitioner or PractitionerRole or HIEPatient)
* recorder ^type.profile = Canonical(HIEReference)

* asserter 1..1
* asserter only Reference(Patient or HIEPractitioner or PractitionerRole or RelatedPerson)
* asserter ^type.profile = Canonical(HIEReference)

* stage 0..*
  * summary 0..1
  * summary only HIECodeableConcept
  * type 0..1
  * type only HIECodeableConcept
  * assessment 0..*
  * assessment only Reference(Observation or DiagnosticReport)
  * assessment ^type.profile = Canonical(HIEReference)

* evidence 0..*
  * code 0..*
  * code only HIECodeableConcept
  * detail 0..*
  * detail ^type.profile = Canonical(HIEReference)

* note 0..*
* note only HIEAnnotation
