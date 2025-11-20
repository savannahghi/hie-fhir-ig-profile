Instance: HIEClaim-example
InstanceOf: HIEClaim
Usage: #example
Title: "Example HIE Claim"
Description: "Outpatient professional claim with one diagnosis and one item"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>HIE Claim</b></p>
  <p>Outpatient professional claim for Jane Patient, created 2025-11-12. Billed by Acme Health Center to PayerOne Insurance.</p>
  <table>
    <thead>
      <tr><th align="left">Section</th><th align="left">Details</th></tr>
    </thead>
    <tbody>
      <tr>
        <td>Identifiers</td>
        <td>Claim Number: CLM-2025-0001</td>
      </tr>
      <tr>
        <td>Claim</td>
        <td>Status: active, Use: claim, Type: professional, Priority: routine</td>
      </tr>
      <tr>
        <td>Patient</td>
        <td>Jane Patient (Patient/p-001)</td>
      </tr>
      <tr>
        <td>Billable period</td>
        <td>2025-11-10 to 2025-11-10</td>
      </tr>
      <tr>
        <td>Provider</td>
        <td>Acme Health Center (Organization/org-001)</td>
      </tr>
      <tr>
        <td>Insurer</td>
        <td>PayerOne Insurance (Organization/org-payer-001), Coverage cov-001, Focal: true</td>
      </tr>
      <tr>
        <td>Diagnosis</td>
        <td>Primary: Headache (R51.9 ICD-10-CM)</td>
      </tr>
      <tr>
        <td>Items</td>
        <td>1 x 99213, Office/outpatient visit est, UnitPrice 75.00 USD, Net 75.00 USD</td>
      </tr>
      <tr>
        <td>Total</td>
        <td>Category: submitted, Amount: 75.00 USD</td>
      </tr>
    </tbody>
  </table>
</div>
"""

* identifier[0].use = #official
* identifier[0].system = "http://example.org/claims"
* identifier[0].value = "CLM-2025-0001"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #ACSN
* identifier[0].type.coding[0].display = "Accession ID"

* status = #active
* use = #claim
* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/claim-type"
* type.coding[0].code = #professional
* type.coding[0].display = "Professional"
* priority.coding[0].system = "http://terminology.hl7.org/CodeSystem/processpriority"
* priority.coding[0].code = #routine
* priority.coding[0].display = "Routine"

* patient.reference = "Patient/p-001"
* patient.display = "Jane Patient"
* billablePeriod.start = "2025-11-10"
* billablePeriod.end = "2025-11-10"

* created = "2025-11-12T10:15:00+03:00"
* provider.reference = "Organization/org-001"
* provider.display = "Acme Health Center"
* insurer.reference = "Organization/org-payer-001"
* insurer.display = "PayerOne Insurance"

* insurance[0].sequence = 1
* insurance[0].focal = true
* insurance[0].coverage.reference = "Coverage/cov-001"
* insurance[0].coverage.display = "Primary PPO Plan"

* diagnosis[0].sequence = 1
* diagnosis[0].diagnosisCodeableConcept.coding[0].system = "http://hl7.org/fhir/sid/icd-10-cm"
* diagnosis[0].diagnosisCodeableConcept.coding[0].code = #R51.9
* diagnosis[0].diagnosisCodeableConcept.coding[0].display = "Headache, unspecified"
* diagnosis[0].type[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/claim-diagnosis-type"
* diagnosis[0].type[0].coding[0].code = #principal
* diagnosis[0].type[0].coding[0].display = "Principal Diagnosis"

* item[0].sequence = 1
* item[0].productOrService.coding[0].system = "http://www.ama-assn.org/go/cpt"
* item[0].productOrService.coding[0].code = #99213
* item[0].productOrService.coding[0].display = "Office or other outpatient visit, established patient"
* item[0].encounter[0].reference = "Encounter/enc-001"
* item[0].encounter[0].display = "Ambulatory visit 2025-11-10"
* item[0].quantity.value = 1
* item[0].unitPrice.value = 75.00
* item[0].unitPrice.currency = #USD
* item[0].net.value = 75.00
* item[0].net.currency = #USD

* item[0].category.coding[0].system = "http://terminology.hl7.org/CodeSystem/ex-benefitcategory"
* item[0].category.coding[0].code = #professional-visit
* item[0].category.coding[0].display = "Professional Visit"
* item[0].revenue.coding[0].system = "http://terminology.hl7.org/CodeSystem/ex-revenue-center"
* item[0].revenue.coding[0].code = #100
* item[0].revenue.coding[0].display = "General Medical"

* item[0].detail[0].sequence = 1
* item[0].detail[0].productOrService.coding[0].system = "http://www.ama-assn.org/go/cpt"
* item[0].detail[0].productOrService.coding[0].code = #99213
* item[0].detail[0].productOrService.coding[0].display = "Office or other outpatient visit, established patient"
* item[0].detail[0].quantity.value = 1
* item[0].detail[0].unitPrice.value = 75.00
* item[0].detail[0].unitPrice.currency = #USD
* item[0].detail[0].net.value = 75.00
* item[0].detail[0].net.currency = #USD

* item[0].detail[0].subDetail[0].sequence = 1
* item[0].detail[0].subDetail[0].productOrService.coding[0].system = "http://www.ama-assn.org/go/cpt"
* item[0].detail[0].subDetail[0].productOrService.coding[0].code = #99070
* item[0].detail[0].subDetail[0].productOrService.coding[0].display = "Supplies and materials"
* item[0].detail[0].subDetail[0].quantity.value = 1
* item[0].detail[0].subDetail[0].unitPrice.value = 5.00
* item[0].detail[0].subDetail[0].unitPrice.currency = #USD
* item[0].detail[0].subDetail[0].net.value = 5.00
* item[0].detail[0].subDetail[0].net.currency = #USD

* total.value = 75.00
* total.currency = #USD
