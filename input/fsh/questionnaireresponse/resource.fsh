Invariant: hie-qr-item-has-answer-or-children
Description: "Each item must contain an answer or nested items"
Severity: #warning
Expression: "item.exists() implies (item.answer.exists() or item.item.exists())"

Invariant: hie-qr-answer-has-value-or-children
Description: "Each answer must have a value or nested items"
Severity: #error
Expression: "answer.exists() implies answer.all(value.exists() or item.exists())"

Profile: HIEQuestionnaireResponse
Parent: QuestionnaireResponse
Id: hie-questionnaireresponse
Title: "HIE QuestionnaireResponse"
Description: "R4B QuestionnaireResponse profiled for HIE capture. Emphasizes linkage to Questionnaire, subject and encounter context, authorship, and structured item answers."
* ^status = #active

* ^language = #en
* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE QuestionnaireResponse</b></p>
  <p>Response container for an administered Questionnaire in HIE workflows. Ensures stable linkage to the source Questionnaire, clear subject and encounter context, authored timestamp, and structured answers.</p>
  <ul>
    <li>Must Support: questionnaire, status, subject, authored, item</li>
    <li>Context: subject → HIEPatient, encounter → HIEEncounter, author/source optional</li>
    <li>Structure: every item carries answers or child items; every answer has a value or child items</li>
  </ul>
</div>
"""

* insert SharedIdentifierRules
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* questionnaire 1..1 MS
* status 1..1 MS
* subject 1..1 MS
* authored 1..1 MS

* subject only Reference(HIEPatient)
* subject ^type.profile = Canonical(HIEReference)

* encounter 0..1 MS
* encounter only Reference(HIEEncounter)
* encounter ^type.profile = Canonical(HIEReference)

* author 0..1
* author only Reference(HIEPractitioner or HIEPractitionerRole or HIEPatient or RelatedPerson)
* author ^type.profile = Canonical(HIEReference)

* source 0..1
* source only Reference(HIEPractitioner or HIEPractitionerRole or HIEPatient or RelatedPerson)
* source ^type.profile = Canonical(HIEReference)

* basedOn only Reference(ServiceRequest)
* basedOn ^type.profile = Canonical(HIEReference)

* partOf only Reference(HIEObservation or Procedure)
* partOf ^type.profile = Canonical(HIEReference)

* item 1..* MS
* obeys hie-qr-item-has-answer-or-children
* item.linkId 1..1 MS
* item.definition 0..1
* item.text 0..1 MS

* item.answer 0..* MS
* obeys hie-qr-answer-has-value-or-children
* item.answer.value[x] 0..1
* item.answer.item 0..*
* item.item 0..*
