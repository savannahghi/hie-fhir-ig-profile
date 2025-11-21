Profile: HIEMedication
Parent: Medication
Id: hie-medication
Title: "HIE Medication"
Description: "R4B Medication profiled for HIE directories, e-prescribing, and dispensing. Focus on stable identifiers, clinical code, status, form, ingredients with strength, manufacturer, and batch."
* ^status = #active

* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE Medication</b></p>
  <p>Medication definition for interoperable ordering and dispensing. Requires a clinical code, status, and form. Supports ingredients with strength, manufacturer attribution, packaging amount, and batch details.</p>
  <ul>
    <li>Must Support: identifier, code, status, form, ingredient.item[x], ingredient.strength</li>
    <li>Optional: manufacturer, amount, batch.lotNumber, batch.expirationDate</li>
    <li>Coding: prefer RxNorm or local formulary for code and ingredients</li>
  </ul>
</div>
"""

* insert SharedIdentifierRules
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* code 1..1 MS
* code only HIECodeableConcept

* status 1..1 MS

* manufacturer only Reference(HIEOrganization)
* manufacturer ^type.profile = Canonical(HIEReference)

* form 1..1 MS
* form only HIECodeableConcept //Bind to Local VS

* ingredient 0..* MS
* ingredient.item[x] 1..1 MS
* ingredient.itemCodeableConcept only HIECodeableConcept
* ingredient.itemReference only Reference(Substance)
* ingredient.itemReference ^type.profile = Canonical(HIEReference)
* ingredient.isActive 1..1 MS
* ingredient.strength 1..1 MS
