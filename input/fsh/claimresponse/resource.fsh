Profile: HIEClaimResponse
Parent: ClaimResponse
Id: hie-claimresponse
Title: "HIE ClaimResponse"
Description: "R4B ClaimResponse constrained for HIE payer adjudication exchanges. Focus on request linkage, parties, outcome, adjudication details, totals, and payment."
* ^status = #active

* ^language = #en
* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE ClaimResponse</b></p>
  <p>Payer adjudication response aligned to HIE workflows. Emphasizes identifiers, request linkage, insurer, outcome, item-level adjudication, totals, and payment signals.</p>
  <ul>
    <li>Must Support: status, use, patient, created, insurer, outcome, request</li>
    <li>Adjudication: item.adjudication and addItem.adjudication require category and allow reason and amount</li>
    <li>Totals: total requires category and amount</li>
    <li>Payment: optional, includes type, date, amount, and adjustment</li>
  </ul>
</div>
"""

* insert SharedIdentifierRules
* identifier 1..* MS
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* status 1..1 MS
* use 1..1 MS
* type only HIECodeableConcept

* patient 1..1 MS
* patient only Reference(HIEPatient)
* patient ^type.profile = Canonical(HIEReference)

* created 1..1 MS

* insurer 1..1 MS
* insurer only Reference(HIEOrganization)
* insurer ^type.profile = Canonical(HIEReference)

* requestor 1..1
* requestor only Reference(HIEPractitioner or PractitionerRole or HIEOrganization)
* requestor ^type.profile = Canonical(HIEReference)

* request 1..1 MS
* request only Reference(HIEClaim)
* request ^type.profile = Canonical(HIEReference)

* outcome 1..1 MS

* payeeType 0..1
* payeeType only HIECodeableConcept

* item 1..* MS
* item.adjudication 1..*
* item.adjudication.category only HIECodeableConcept
* item.adjudication.reason only HIECodeableConcept
* item.adjudication.amount 1..1

* item.detail 1..*
* item.detail.detailSequence 1..1
* item.detail.noteNumber 0..*
* item.detail.adjudication 1..*
* item.detail.adjudication.category only HIECodeableConcept
* item.detail.adjudication.reason only HIECodeableConcept

* item.detail.subDetail 0..*
* item.detail.subDetail.subDetailSequence 1..1
* item.detail.subDetail.noteNumber 0..*
* item.detail.subDetail.adjudication 1..*
* item.detail.subDetail.adjudication.category only HIECodeableConcept
* item.detail.subDetail.adjudication.reason only HIECodeableConcept

* addItem 0..*
* addItem.provider 0..*
* addItem.provider only Reference(HIEPractitioner or PractitionerRole or HIEOrganization)
* addItem.provider ^type.profile = Canonical(HIEReference)
* addItem.productOrService only HIECodeableConcept
* addItem.modifier only HIECodeableConcept
* addItem.programCode only HIECodeableConcept
* addItem.bodySite only HIECodeableConcept 
* addItem.subSite only HIECodeableConcept 
* addItem.adjudication.category only HIECodeableConcept
* addItem.adjudication.reason only HIECodeableConcept

* addItem.detail 0..*
* addItem.detail.productOrService only HIECodeableConcept
* addItem.detail.modifier only HIECodeableConcept
* addItem.detail.adjudication 1..*
* addItem.detail.adjudication.category only HIECodeableConcept
* addItem.detail.adjudication.reason only HIECodeableConcept

* addItem.detail.subDetail 0..*
* addItem.detail.subDetail.productOrService only HIECodeableConcept
* addItem.detail.subDetail.modifier only HIECodeableConcept
* addItem.detail.subDetail.adjudication 1..*
* addItem.detail.subDetail.adjudication.category only HIECodeableConcept
* addItem.detail.subDetail.adjudication.reason only HIECodeableConcept

* total 1..* MS
* total.category only HIECodeableConcept
* total.amount 1..1

* payment 1..1
* payment.type only HIECodeableConcept
* payment.adjustmentReason only HIECodeableConcept

* fundsReserve only HIECodeableConcept

* formCode only HIECodeableConcept

* processNote 0..*
* processNote.language only HIECodeableConcept

* communicationRequest 0..*
* communicationRequest only Reference(CommunicationRequest)
* communicationRequest ^type.profile = Canonical(HIEReference)

* insurance 1..*
* insurance.coverage only Reference(Coverage)
* insurance.coverage ^type.profile = Canonical(HIEReference)
* insurance.claimResponse only Reference(HIEClaimResponse)
* insurance.claimResponse ^type.profile = Canonical(HIEReference)