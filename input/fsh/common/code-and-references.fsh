// Invariants

Invariant: hie-cc-text-or-code
Description: "Text is optional, coding is required"
Severity: #warning
Expression: "coding.exists()"

Invariant: hie-cr-at-least-one
Description: "Provide concept or reference, at least one"
Severity: #error
Expression: "concept.exists() or reference.exists()"

// HIE CodeableConcept
Profile: HIECodeableConcept
Parent: CodeableConcept
Id: hie-codeable-concept
Title: "HIE CodeableConcept"
Description: "A CodeableConcept for HIE use. Codes are required, text is optional."
* ^status = #active
* coding 1..*
  * system 1..1
  * code 1..1
  * display 1..1
* text 0..1
* obeys hie-cc-text-or-code

// HIE Reference (datatype profile)
Profile: HIEReference
Parent: Reference
Id: hie-reference
Title: "HIE Reference"
Description: "A Reference that is resolvable, with display for UX."
* ^status = #active
* reference 1..1 MS
* type 0..1
* display 1..1 MS

// HIE Annotation
Profile: HIEAnnotation
Parent: Annotation
Id: hie-annotation
Title: "HIE Annotation"
Description: "A text note with author and time."
* ^status = #active
* time 1..1 MS
* text 1..1 MS
* author[x] 1..1 MS
* author[x] only Reference(HIEPractitioner or Patient or RelatedPerson)

// HIE CodeableReference
Profile: HIECodeableReference
Parent: CodeableReference
Id: hie-codeable-reference
Title: "HIE CodeableReference"
Description: "A CodeableReference constrained for HIE use."
* ^status = #active
* concept only HIECodeableConcept
* reference only HIEReference
* concept MS
* reference MS
* obeys hie-cr-at-least-one
