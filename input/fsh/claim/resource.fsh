Profile: HIEClaim
Parent: Claim
Id: claim
Title: "HIE Claim"
Description: "R4B Claim constrained for HIE submission and exchange. Emphasizes core administrative data, patient, provider, insurer, billable period, coverage, diagnosis, items, and totals."
* ^status = #active

* ^language = #en
* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE Claim</b></p>
  <p>Constrained Claim for interoperable submission to payers and HIE hubs. Focus on status, type, use, patient, created, provider, priority, insurer, insurance array, diagnosis, items, and total.</p>
  <ul>
    <li>Must Support: status, type, use, patient, created, provider, priority, insurance, diagnosis, item.productOrService, total</li>
    <li>Bindings: use (required), type (extensible), priority (required), item.category/class (extensible)</li>
    <li>References: patient → HIEPatient, provider/organization → HIEOrganization, insurer → HIEOrganization, encounter → HIEEncounter, coverage → Coverage</li>
  </ul>
</div>
"""

* insert SharedIdentifierRules
* identifier 1..* MS
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* status 1..1 MS
* type 1..1 MS
* type only HIECodeableConcept

* subType 0..1
* subType only HIECodeableConcept

* use 1..1 MS

* patient 1..1 MS
* patient only Reference(HIEPatient)
* patient ^type.profile = Canonical(HIEReference)

* billablePeriod 1..1

* created 1..1 MS

* enterer 0..1
* enterer only Reference(HIEPractitioner or PractitionerRole)
* enterer ^type.profile = Canonical(HIEReference)

* insurer 0..1
* insurer only Reference(HIEOrganization)
* insurer ^type.profile = Canonical(HIEReference)

* provider 1..1 MS
* provider only Reference(HIEOrganization or HIEPractitioner or PractitionerRole)
* provider ^type.profile = Canonical(HIEReference)

* priority 1..1 MS
* priority only HIECodeableConcept

* fundsReserve 0..1
* fundsReserve only HIECodeableConcept

* related 0..*
* related.claim 0..1
* related.claim only Reference(HIEClaim)
* related.claim ^type.profile = Canonical(HIEReference)

* prescription 0..1
* prescription ^type.profile = Canonical(HIEReference)
* originalPrescription 0..1
* originalPrescription ^type.profile = Canonical(HIEReference)

* payee 0..1
* payee.type only HIECodeableConcept
* payee.party 1..1
* payee.party only Reference(HIEPractitioner or PractitionerRole or HIEOrganization or HIEPatient or RelatedPerson)
* payee.party ^type.profile = Canonical(HIEReference)

* referral 0..1
* referral only Reference(ServiceRequest)
* referral ^type.profile = Canonical(HIEReference)

* facility 0..1
* facility only Reference(Location)
* facility ^type.profile = Canonical(HIEReference)

* insurance 1..* MS
* insurance.sequence 1..1
* insurance.focal 1..1
* insurance.coverage 1..1
* insurance.coverage only Reference(Coverage)
* insurance.coverage ^type.profile = Canonical(HIEReference)
* insurance.claimResponse ^type.profile = Canonical(HIEReference)

* accident 0..1
* accident.type only HIECodeableConcept

* diagnosis 1..* MS
* diagnosis.sequence 1..1
* diagnosis.diagnosis[x] 1..1
* diagnosis.diagnosisCodeableConcept only HIECodeableConcept
* diagnosis.diagnosisReference ^type.profile = Canonical(HIEReference)
* diagnosis.type 0..*
* diagnosis.type only HIECodeableConcept
* diagnosis.onAdmission 0..1
* diagnosis.onAdmission only HIECodeableConcept
* diagnosis.packageCode 0..1
* diagnosis.packageCode only HIECodeableConcept

* procedure 0..*
* procedure.sequence 1..1
* procedure.procedure[x] 1..1
* procedure.procedureCodeableConcept only HIECodeableConcept
* procedure.procedureReference ^type.profile = Canonical(HIEReference)
* procedure.type 0..*
* procedure.type only HIECodeableConcept
* procedure.udi ^type.profile = Canonical(HIEReference)

* supportingInfo 0..*
* supportingInfo.sequence 1..1
* supportingInfo.category 1..1
* supportingInfo.category only HIECodeableConcept
* supportingInfo.code 0..1
* supportingInfo.code only HIECodeableConcept
* supportingInfo.timing[x] 0..1
* supportingInfo.value[x] 0..1
* supportingInfo.reason 0..1
* supportingInfo.reason only HIECodeableConcept
* supportingInfo.valueReference ^type.profile = Canonical(HIEReference)

* careTeam 0..*
* careTeam.sequence 1..1
* careTeam.provider 1..1
* careTeam.provider only Reference(HIEPractitioner or PractitionerRole or HIEOrganization)
* careTeam.provider ^type.profile = Canonical(HIEReference)
* careTeam.role 0..1
* careTeam.role only HIECodeableConcept
* careTeam.qualification 0..1
* careTeam.qualification only HIECodeableConcept

* item 1..* MS
* item.sequence 1..1
* item.careTeamSequence 0..*
* item.diagnosisSequence 0..*
* item.procedureSequence 0..*
* item.informationSequence 0..*
* item.revenue 0..1
* item.revenue only HIECodeableConcept
* item.category 0..1
* item.category only HIECodeableConcept
* item.productOrService 1..1 MS
* item.productOrService only HIECodeableConcept
* item.modifier 0..*
* item.modifier only HIECodeableConcept
* item.programCode 0..*
* item.programCode only HIECodeableConcept

* item.serviced[x] 0..1
* item.location[x] 0..1
* item.encounter 1..1
* item.encounter only Reference(HIEEncounter)
* item.encounter ^type.profile = Canonical(HIEReference)

* item.quantity 0..1
* item.unitPrice 0..1
* item.factor 0..1
* item.net 0..1

* item.udi 0..*
* item.udi ^type.profile = Canonical(HIEReference)
* item.bodySite 0..1
* item.bodySite only HIECodeableConcept
* item.subSite 0..*
* item.subSite only HIECodeableConcept

* item.detail 0..*
* item.detail.sequence 1..1
* item.detail.revenue 0..1
* item.detail.revenue only HIECodeableConcept
* item.detail.category 0..1
* item.detail.category only HIECodeableConcept
* item.detail.productOrService 1..1
* item.detail.productOrService only HIECodeableConcept
* item.detail.modifier 0..*
* item.detail.modifier only HIECodeableConcept
* item.detail.quantity 0..1
* item.detail.unitPrice 0..1
* item.detail.factor 0..1
* item.detail.net 0..1
* item.detail.udi 0..*
* item.detail.udi ^type.profile = Canonical(HIEReference)

* item.detail.subDetail 0..*
* item.detail.subDetail.sequence 1..1
* item.detail.subDetail.revenue 0..1
* item.detail.subDetail.revenue only HIECodeableConcept
* item.detail.subDetail.category 0..1
* item.detail.subDetail.category only HIECodeableConcept
* item.detail.subDetail.productOrService 1..1
* item.detail.subDetail.productOrService only HIECodeableConcept
* item.detail.subDetail.modifier 0..*
* item.detail.subDetail.modifier only HIECodeableConcept
* item.detail.subDetail.programCode 0..*
* item.detail.subDetail.programCode only HIECodeableConcept
* item.detail.subDetail.quantity 0..1
* item.detail.subDetail.unitPrice 0..1
* item.detail.subDetail.factor 0..1
* item.detail.subDetail.net 0..1
* item.detail.subDetail.udi 0..*
* item.detail.subDetail.udi ^type.profile = Canonical(HIEReference)

* total 1..1 MS