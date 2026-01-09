Profile: HIEConsent
Parent: Consent
Id: consent
Title: "HIE Consent"
Description: "R4B Consent profiled for HIE workflows, emphasizing clear scope, category, subject, policy, and computable provisions."
* ^status = #active

* ^language = #en
* ^text.status = #generated
* ^text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE Consent</b></p>
  <p>Consent record for health information exchange. Requires status, scope, category, patient, and at least one computable signal such as policy, policyRule, or provision.</p>
  <ul>
    <li>Must Support: status, scope, category, patient, dateTime, performer, organization, policy, policyRule, provision</li>
    <li>Bindings: status (required), scope (required), category (extensible), action (extensible), securityLabel (extensible), purpose (extensible)</li>
    <li>References: patient → HIEPatient, performer → clinical actors and organizations, organization → HIEOrganization</li>
  </ul>
</div>
"""

* insert SharedIdentifierRules
* identifier 1..* MS
* identifier.use from $identifier-use (required)
* identifier.type from $identifier-type (extensible)

* status 1..1 MS

* scope 1..1 MS
* scope only HIECodeableConcept

* category 1..* MS
* category only HIECodeableConcept

* patient 1..1 MS
* patient only Reference(HIEPatient)
* patient ^type.profile = Canonical(HIEReference)

* dateTime 0..1 MS

* performer 1..* MS
* performer only Reference(HIEPatient or HIEPractitioner or PractitionerRole or RelatedPerson or HIEOrganization)
* performer ^type.profile = Canonical(HIEReference)

* organization 1..* MS
* organization only Reference(HIEOrganization)
* organization ^type.profile = Canonical(HIEReference)

* policyRule 0..1
* policyRule only HIECodeableConcept

* verification 0..*
* verification.verifiedWith only Reference(HIEPatient or RelatedPerson)

* provision 0..1 MS

* provision.actor 0..*
* provision.actor.role 1..1
* provision.actor.role only HIECodeableConcept
* provision.actor.reference 1..1
* provision.actor.reference only Reference(HIEPatient or HIEPractitioner or PractitionerRole or RelatedPerson or Organization or CareTeam or Device)
* provision.actor.reference ^type.profile = Canonical(HIEReference)

* provision.action 0..*
* provision.action only HIECodeableConcept

* provision.code 0..*
* provision.code only HIECodeableConcept

* provision.data 0..*
* provision.data.meaning 1..1
* provision.data.reference 1..1
* provision.data.reference ^type.profile = Canonical(HIEReference)

* provision.provision 0..*

* provision.extension 0..*
* provision.hasChildren()
