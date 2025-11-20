Profile: HIEAllergyIntolerance
Parent: AllergyIntolerance
Id: hie-allergyintolerance
Title: "HIE AllergyIntolerance"
Description: "R4B AllergyIntolerance constrained for HIE capture and exchange."
* ^status = #active

* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE AllergyIntolerance</b></p>
  <p>Allergy or intolerance record tailored for exchange across HIE systems. Focus on clear verification, clinical status, coded substance, and structured reactions.</p>

  <p><b>Must Support elements</b></p>
  <ul>
    <li>verificationStatus, clinicalStatus</li>
    <li>type, category, criticality</li>
    <li>patient</li>
    <li>code</li>
    <li>reaction.manifestation, reaction.severity</li>
  </ul>

  <p><b>Key bindings</b></p>
  <table>
    <thead>
      <tr><th align="left">Element</th><th align="left">ValueSet</th><th align="left">Strength</th></tr>
    </thead>
    <tbody>
      <tr><td>clinicalStatus</td><td>AllergyIntolerance Clinical Status ($ai-clinical)</td><td>required</td></tr>
      <tr><td>verificationStatus</td><td>AllergyIntolerance Verification ($ai-verification)</td><td>required</td></tr>
      <tr><td>type</td><td>Allergy/Intolerance Type ($ai-type)</td><td>required</td></tr>
      <tr><td>category</td><td>Allergy/Intolerance Category ($ai-category)</td><td>required</td></tr>
      <tr><td>criticality</td><td>AllergyIntolerance Criticality ($ai-criticality)</td><td>required</td></tr>
      <tr><td>code</td><td>Allergy/Intolerance Code ($ai-code)</td><td>extensible</td></tr>
      <tr><td>reaction.severity</td><td>Reaction Event Severity ($reaction-severity)</td><td>required</td></tr>
      <tr><td>reaction.exposureRoute</td><td>Route Codes ($route-codes)</td><td>extensible</td></tr>
    </tbody>
  </table>

  <p><b>References</b></p>
  <ul>
    <li>patient → HIEPatient</li>
    <li>encounter → HIEEncounter</li>
    <li>recorder, asserter → HIEPractitioner, PractitionerRole, Organization, Patient, RelatedPerson</li>
  </ul>
</div>
"""

* insert SharedIdentifierRules
* identifier 1..* MS
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* clinicalStatus 0..1 MS
* clinicalStatus only HIECodeableConcept
* clinicalStatus from $ai-clinical (required)

* verificationStatus 1..1 MS
* verificationStatus only HIECodeableConcept
* verificationStatus from $ai-verification (required)

* type 0..1 MS
* type from $ai-type (required)

* category 0..* MS
* category from $ai-category (required)

* criticality 0..1 MS
* criticality from $ai-criticality (required)

* patient 1..1 MS
* patient only Reference(HIEPatient)
* patient ^type.profile = Canonical(HIEReference)

* encounter 1..1
* encounter only Reference(HIEEncounter)
* encounter ^type.profile = Canonical(HIEReference)

* recordedDate 1..1 MS

* recorder 0..1
* recorder only Reference(HIEPractitioner or PractitionerRole)
* recorder ^type.profile = Canonical(HIEReference)

* asserter 1..1
* asserter only Reference(HIEPatient or HIEPractitioner or PractitionerRole or RelatedPerson)
* asserter ^type.profile = Canonical(HIEReference)

* reaction 1..* MS
* reaction.substance 0..1
* reaction.substance only HIECodeableConcept
* reaction.manifestation 1..* MS
* reaction.manifestation only HIECodeableConcept
* reaction.description 0..1
* reaction.onset 0..1
* reaction.severity 0..1 MS
* reaction.severity from $reaction-severity (required)
* reaction.exposureRoute 0..1
* reaction.exposureRoute only HIECodeableConcept
* reaction.note 0..*
* reaction.note only HIEAnnotation
