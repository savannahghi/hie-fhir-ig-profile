Instance: HIEClaimResponse-example
InstanceOf: HIEClaimResponse
Usage: #example
Title: "Example HIE ClaimResponse"
Description: "Adjudication response for outpatient consult with approved payment"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>ClaimResponse Summary</b></p>
  <p>Outcome complete. Primary coverage approved with member copay. Payment issued.</p>

  <table>
    <thead>
      <tr>
        <th align="left">Header</th>
        <th align="left">Value</th>
      </tr>
    </thead>
    <tbody>
      <tr><td>Status</td><td>active</td></tr>
      <tr><td>Use</td><td>claim</td></tr>
      <tr><td>Outcome</td><td>complete</td></tr>
      <tr><td>Patient</td><td>Jane Patient</td></tr>
      <tr><td>Insurer</td><td>Acme Health Insurance</td></tr>
      <tr><td>Request</td><td>Claim/claim-001</td></tr>
      <tr><td>Created</td><td>2025-11-15</td></tr>
    </tbody>
  </table>

  <p><b>Item Adjudication</b></p>
  <table>
    <thead>
      <tr>
        <th align="left">ItemSeq</th>
        <th align="left">Category</th>
        <th align="left">Reason</th>
        <th align="left">Amount</th>
      </tr>
    </thead>
    <tbody>
      <tr><td>1</td><td>eligible</td><td></td><td>100.00 USD</td></tr>
      <tr><td>1</td><td>copay</td><td></td><td>20.00 USD</td></tr>
      <tr><td>1</td><td>benefit</td><td></td><td>80.00 USD</td></tr>
    </tbody>
  </table>

  <p><b>Totals</b></p>
  <ul>
    <li>Submitted: 100.00 USD</li>
    <li>Copay: 20.00 USD</li>
    <li>Benefit: 80.00 USD</li>
  </ul>

  <p><b>Payment</b></p>
  <ul>
    <li>Type: payment</li>
    <li>Date: 2025-11-16</li>
    <li>Amount: 80.00 USD</li>
    <li>Reference: EPI-778899</li>
  </ul>

  <p><b>Notes</b></p>
  <ul>
    <li>Approved per plan. Member copay applied.</li>
  </ul>
</div>
"""

* identifier[0].use = #official
* identifier[0].system = "http://payer.example.org/claimresponses"
* identifier[0].value = "CR-2025-0001"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #ACSN
* identifier[0].type.coding[0].display = "Accession ID"

* status = #active
* use = #claim
* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/claim-type"
* type.coding[0].code = #professional
* type.coding[0].display = "Professional"

* patient.reference = "Patient/p-001"
* patient.display = "Jane Patient"

* created = "2025-11-15"

* insurer.reference = "Organization/ins-001"
* insurer.display = "Acme Health Insurance"

* requestor.reference = "Organization/org-001"
* requestor.display = "Acme Health Center"

* request.reference = "Claim/claim-001"
* request.display = "OP consult claim"

* outcome = #complete
* disposition = "Approved per plan rules. Member copay applied."
* preAuthRef = "PA-556677"

* insurance[0].sequence = 1
* insurance[0].focal = true
* insurance[0].coverage.reference = "Coverage/cov-001"
* insurance[0].coverage.display = "Primary PPO coverage"

* item[0].itemSequence = 1
* item[0].adjudication[0].category.coding[0].system = "http://terminology.hl7.org/CodeSystem/adjudication"
* item[0].adjudication[0].category.coding[0].code = #eligible
* item[0].adjudication[0].category.coding[0].display = "Eligible"
* item[0].adjudication[0].amount.value = 100
* item[0].adjudication[0].amount.currency = #USD

* item[0].adjudication[1].category.coding[0].system = "http://terminology.hl7.org/CodeSystem/adjudication"
* item[0].adjudication[1].category.coding[0].code = #copay
* item[0].adjudication[1].category.coding[0].display = "Copay"
* item[0].adjudication[1].amount.value = 20
* item[0].adjudication[1].amount.currency = #USD

* item[0].adjudication[2].category.coding[0].system = "http://terminology.hl7.org/CodeSystem/adjudication"
* item[0].adjudication[2].category.coding[0].code = #benefit
* item[0].adjudication[2].category.coding[0].display = "Benefit amount"
* item[0].adjudication[2].amount.value = 80
* item[0].adjudication[2].amount.currency = #USD

* item[0].detail[0].detailSequence = 1
* item[0].detail[0].adjudication[0].category.coding[0].system = "http://terminology.hl7.org/CodeSystem/adjudication"
* item[0].detail[0].adjudication[0].category.coding[0].code = #eligible
* item[0].detail[0].adjudication[0].category.coding[0].display = "Eligible"
* item[0].detail[0].adjudication[0].amount.value = 100
* item[0].detail[0].adjudication[0].amount.currency = #USD

* item[0].detail[0].subDetail[0].subDetailSequence = 1
* item[0].detail[0].subDetail[0].adjudication[0].category.coding[0].system = "http://terminology.hl7.org/CodeSystem/adjudication"
* item[0].detail[0].subDetail[0].adjudication[0].category.coding[0].code = #benefit
* item[0].detail[0].subDetail[0].adjudication[0].category.coding[0].display = "Benefit amount"
* item[0].detail[0].subDetail[0].adjudication[0].amount.value = 80
* item[0].detail[0].subDetail[0].adjudication[0].amount.currency = #USD

* addItem[0].productOrService.coding[0].system = "http://example.org/codes/payer-adjustment"
* addItem[0].productOrService.coding[0].code = #ADJ001
* addItem[0].productOrService.coding[0].display = "Administrative adjustment"
* addItem[0].adjudication[0].category.coding[0].system = "http://terminology.hl7.org/CodeSystem/adjudication"
* addItem[0].adjudication[0].category.coding[0].code = #eligible
* addItem[0].adjudication[0].category.coding[0].display = "Eligible"
* addItem[0].adjudication[0].amount.value = 0
* addItem[0].adjudication[0].amount.currency = #USD

* total[0].category.coding[0].system = "http://terminology.hl7.org/CodeSystem/adjudication"
* total[0].category.coding[0].code = #submitted
* total[0].category.coding[0].display = "Submitted Amount"
* total[0].amount.value = 100
* total[0].amount.currency = #USD

* total[1].category.coding[0].system = "http://terminology.hl7.org/CodeSystem/adjudication"
* total[1].category.coding[0].code = #copay
* total[1].category.coding[0].display = "Copay"
* total[1].amount.value = 20
* total[1].amount.currency = #USD

* total[2].category.coding[0].system = "http://terminology.hl7.org/CodeSystem/adjudication"
* total[2].category.coding[0].code = #benefit
* total[2].category.coding[0].display = "Benefit Amount"
* total[2].amount.value = 80
* total[2].amount.currency = #USD

* payment.type.coding[0].system = "http://terminology.hl7.org/CodeSystem/ex-paymenttype"
* payment.type.coding[0].code = #payment
* payment.type.coding[0].display = "Payment"
* payment.date = "2025-11-16"
* payment.amount.value = 80
* payment.amount.currency = #USD
* payment.identifier.system = "http://payer.example.org/erds"
* payment.identifier.value = "EPI-778899"

* processNote[0].number = 1
* processNote[0].type = #display
* processNote[0].text = "Approved per plan. Member copay applied."
* processNote[0].language.coding[0].system = "urn:ietf:bcp:47"
* processNote[0].language.coding[0].code = #en
* processNote[0].language.coding[0].display = "English"