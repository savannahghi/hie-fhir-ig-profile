Invariant: hie-q-has-items
Description: "Questionnaire must have at least one root item"
Severity: #error
Expression: "item.exists()"

Invariant: hie-q-unique-linkid
Description: "linkId values must be unique within the questionnaire"
Severity: #error
Expression: "item.select(linkId).isDistinct()"

Invariant: hie-q-group-no-answers
Description: "Group items do not have answers, initial, or answer value sets"
Severity: #error
Expression: "(type != 'group') or (answerOption.empty() and answerValueSet.empty() and initial.empty())"

Invariant: hie-q-leaf-answerable
Description: "Non-group, non-display items must be answerable or descriptive"
Severity: #warning
Expression: "(type in {'group','display'}) or (answerOption.exists() or answerValueSet.exists() or type.exists())"

Profile: HIEQuestionnaire
Parent: Questionnaire
Id: hie-questionnaire
Title: "HIE Questionnaire"
Description: "R4B Questionnaire profiled for HIE data capture. Emphasizes status, metadata, subject typing, stable linkIds, clear item typing, conditional logic, and controlled answer options."
* ^status = #active

* ^language = #en
* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE Questionnaire</b></p>
  <p>Constrained questionnaire for consistent data capture across HIE workflows. Requires status and at least one item. Enforces unique linkIds and clean item typing. Supports enableWhen logic and controlled answer lists.</p>
  <ul>
    <li>Must Support: status, name or title, date, item, item.linkId, item.type, subjectType</li>
    <li>Logic: enableWhen with allowed operators, enableBehavior any or all</li>
    <li>Answers: answerOption or canonical answerValueSet; initial allowed per item type</li>
  </ul>
</div>
"""

* status 1..1 MS
* name 0..1 MS
* title 1..1 MS
* date 1..1 MS
* description 1..1 MS
* url 1..1 MS

* insert SharedIdentifierRules
* identifier 1..*
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

// Items (root)
* item 1..* MS
* item obeys hie-q-unique-linkid
* obeys hie-q-has-items

* item.linkId 1..1 MS
* item.text 0..1 MS
* item.type 1..1 MS
* item.code 0..*
* item.definition 0..1
* item.required 0..1
* item.repeats 0..1
* item.readOnly 0..1
* item.maxLength 0..1
* item.prefix 0..1
* item.answerValueSet 0..1
* item.answerOption 0..*
* item.answerOption.value[x] 1..1
* item.initial 0..*
* item.initial.value[x] 1..1
* item.enableWhen 0..*
* item.enableBehavior 0..1
* item.enableBehavior ^short = "any or all"

* item obeys hie-q-group-no-answers
* item obeys hie-q-leaf-answerable

* item.enableWhen.operator from $q-operator (required)

* item.extension 0..*
* item.extension ^short = "UI hints and custom constraints"
* item.extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl" (exactly)
* item.extension.valueCodeableConcept 0..1
* item.extension.valueCodeableConcept from $q-item-control (extensible)

* item.item 0..*
* item.item.linkId 1..1
* item.item.type 1..1

* item.required ^short = "If true, at least one answer is expected at runtime"
