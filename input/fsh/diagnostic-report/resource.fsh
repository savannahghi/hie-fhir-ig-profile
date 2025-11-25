Profile: HIEDiagnosticReport
Parent: DiagnosticReport
Id: hie-diagnosticreport
Title: "HIE DiagnosticReport"
Description: "R4B DiagnosticReport constrained for HIE capture and exchange."
* ^status = #active

* ^language = #en
* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE DiagnosticReport</b></p>
  <p>Constrained DiagnosticReport for interoperable exchange. Emphasizes clear status, code, subject, timing, results, and references.</p>
  <ul>
    <li>Must Support: status, code, subject, effective[x], issued, performer, result</li>
    <li>Bindings: status (required), category (extensible), code (extensible), conclusionCode (extensible)</li>
    <li>References: subject → HIEPatient, encounter → HIEEncounter, result → Observation, basedOn → ServiceRequest</li>
  </ul>
</div>
"""

* insert SharedIdentifierRules
* identifier 1..* MS
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* category 0..* MS
* category only HIECodeableConcept // Bind to TS

* code 1..1 MS
* code only HIECodeableConcept
* code from $loinc (extensible)

* subject 1..1 MS
* subject only Reference(HIEPatient)
* subject ^type.profile = Canonical(HIEReference)

* encounter 1..1
* encounter only Reference(HIEEncounter)
* encounter ^type.profile = Canonical(HIEReference)

* basedOn 0..*
* basedOn only Reference(ServiceRequest)
* basedOn ^type.profile = Canonical(HIEReference)

* effective[x] 0..1 MS
* issued 0..1 MS

* performer 1..* MS
* performer only Reference(HIEOrganization or HIEPractitioner or PractitionerRole)
* performer ^type.profile = Canonical(HIEReference)

* resultsInterpreter 0..*
* resultsInterpreter only Reference(HIEPractitioner or PractitionerRole or HIEOrganization)
* resultsInterpreter ^type.profile = Canonical(HIEReference)

* specimen 0..*
* specimen only Reference(Specimen)
* specimen ^type.profile = Canonical(HIEReference)

* result 0..* MS
* result only Reference(Observation)
* result ^type.profile = Canonical(HIEReference)

* imagingStudy 0..*
* imagingStudy only Reference(ImagingStudy)
* imagingStudy ^type.profile = Canonical(HIEReference)

* media 0..*
* media.comment 0..1
* media.link only Reference(Media)
* media.link ^type.profile = Canonical(HIEReference)

* conclusion 1..1
* conclusionCode 0..*
* conclusionCode only HIECodeableConcept