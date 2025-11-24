Profile: HIEDocumentReference
Parent: DocumentReference
Id: hie-documentreference
Title: "HIE DocumentReference"
Description: "R4B DocumentReference constrained for HIE exchange. Requires strong typing, subject linkage, and well-formed attachments."
* ^status = #active

* ^text.status = #generated
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>HIE DocumentReference</b></p><p>Constrained DocumentReference for interoperable registry and retrieval. Focus on status, type, subject, authorship, security labelling, and attachment hygiene.</p></div>"

* insert SharedIdentifierRules
* identifier 1..* MS
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* status 1..1 MS
* status from $docref-status (required)

* docStatus 1..1
* docStatus from $dr-docstatus (required)

* type 1..1 MS
* type only HIECodeableConcept
* type from $doc-typecodes (extensible)

* category 1..* MS
* category only HIECodeableConcept

* subject 1..1 MS
* subject only Reference(HIEPatient)
* subject ^type.profile = Canonical(HIEReference)

* date 1..1 MS

* author 1..* MS
* author only Reference(HIEPractitioner or PractitionerRole or HIEOrganization or HIEPatient)
* author ^type.profile = Canonical(HIEReference)

* authenticator 1..1
* authenticator only Reference(HIEPractitioner or PractitionerRole or HIEOrganization)
* authenticator ^type.profile = Canonical(HIEReference)

* custodian 0..1
* custodian only Reference(HIEOrganization)
* custodian ^type.profile = Canonical(HIEReference)

* securityLabel 0..*
* securityLabel only HIECodeableConcept
* securityLabel from $security-labels (extensible)

* content 1..* MS
* content.attachment 1..1 MS
* content.attachment.contentType 1..1 MS
* content.attachment.language 0..1
* content.attachment.url 0..1
* content.attachment.data 0..1
* content.attachment.size 0..1
* content.attachment.hash 0..1
* content.attachment.title 0..1
* content.attachment.creation 0..1

* context.encounter 1..1
* context.encounter only Reference(HIEEncounter or HIEEpisodeOfCare)
* context.encounter ^type.profile = Canonical(HIEReference)

* context.facilityType 0..1
* context.facilityType only HIECodeableConcept // Bind To TS

* context.practiceSetting 0..1
* context.practiceSetting only HIECodeableConcept // Bind to TS VSs

* context.event 0..*
* context.event only HIECodeableConcept

* context.sourcePatientInfo	 1..1
* context.sourcePatientInfo only Reference(HIEPatient)
* context.sourcePatientInfo ^type.profile = Canonical(HIEReference)

* relatesTo 0..*
* relatesTo.code 1..1
* relatesTo.target 1..1
* relatesTo.target only Reference(HIEDocumentReference)
* relatesTo.target ^type.profile = Canonical(HIEReference)

