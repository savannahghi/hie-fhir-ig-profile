Instance: HIEQuestionnaireResponse-example
InstanceOf: HIEQuestionnaireResponse
Usage: #example
Title: "Example HIE QuestionnaireResponse"
Description: "Completed intake form for ambulatory visit"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>QuestionnaireResponse Summary</b></p>
  <p>Source questionnaire: Questionnaire/qn-001. Status completed. Authored by Dr. John Clinician for Jane Patient during Encounter/enc-001.</p>

  <table>
    <thead>
      <tr><th align="left">Section</th><th align="left">Content</th></tr>
    </thead>
    <tbody>
      <tr>
        <td>Identifiers</td>
        <td>CR-QR-2025-0001 (http://example.org/qr)</td>
      </tr>
      <tr>
        <td>Subject</td>
        <td>Jane Patient (Patient/p-001)</td>
      </tr>
      <tr>
        <td>Encounter</td>
        <td>Ambulatory encounter (Encounter/enc-001)</td>
      </tr>
      <tr>
        <td>Authored</td>
        <td>2025-11-18T10:30:00+03:00</td>
      </tr>
      <tr>
        <td>Author</td>
        <td>Dr. John Clinician (HIEPractitioner/pr-001)</td>
      </tr>
      <tr>
        <td>Based On</td>
        <td>Neurology consult (ServiceRequest/sr-001)</td>
      </tr>
      <tr>
        <td>Part Of</td>
        <td>Outpatient procedure (Procedure/proc-001)</td>
      </tr>
    </tbody>
  </table>

  <p><b>Key Answers</b></p>
  <ul>
    <li>Chief complaint: Headache for two days</li>
    <li>Onset date: 2025-11-16</li>
    <li>Severity: Moderate</li>
    <li>Associated symptoms: Nausea, Photophobia</li>
    <li>Vitals: BP 120/80 mmHg, HR 72 bpm</li>
    <li>Consent given: true</li>
    <li>Clinician notes: No focal deficits. Advise hydration and rest.</li>
  </ul>
</div>
"""

* identifier[0].use = #official
* identifier[0].system = "http://example.org/qr"
* identifier[0].value = "CR-QR-2025-0001"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #ACSN
* identifier[0].type.coding[0].display = "Accession ID"

* questionnaire = "Questionnaire/qn-001"
* status = #completed

* subject.reference = "Patient/p-001"
* subject.display = "Jane Patient"

* encounter.reference = "Encounter/enc-001"
* encounter.display = "Ambulatory encounter"

* authored = "2025-11-18T10:30:00+03:00"

* author.reference = "HIEPractitioner/pr-001"
* author.display = "Dr. John Clinician"

* source.reference = "Patient/p-001"
* source.display = "Jane Patient"

* basedOn[0].reference = "ServiceRequest/sr-001"
* basedOn[0].display = "Neurology consult"

* partOf[0].reference = "Procedure/proc-001"
* partOf[0].display = "Outpatient procedure"

// Items and answers (meet invariants: each item has an answer or children; each answer has a value or child items)
* item[0].linkId = "q1"
* item[0].text = "Chief complaint"
* item[0].answer[0].valueString = "Headache for two days"

* item[1].linkId = "q2"
* item[1].text = "Onset date"
* item[1].answer[0].valueDate = "2025-11-16"

* item[2].linkId = "q3"
* item[2].text = "Severity"
* item[2].answer[0].valueCoding.system = "http://example.org/vs/severity"
* item[2].answer[0].valueCoding.code = #moderate
* item[2].answer[0].valueCoding.display = "Moderate"

* item[3].linkId = "q4"
* item[3].text = "Associated symptoms"
* item[3].answer[0].valueCoding.system = "http://snomed.info/sct"
* item[3].answer[0].valueCoding.code = #422587007
* item[3].answer[0].valueCoding.display = "Nausea"
* item[3].answer[1].valueCoding.system = "http://snomed.info/sct"
* item[3].answer[1].valueCoding.code = #89711000119106
* item[3].answer[1].valueCoding.display = "Photophobia"

* item[4].linkId = "grp-vitals"
* item[4].text = "Vitals"
* item[4].item[0].linkId = "bp"
* item[4].item[0].text = "Blood pressure"
* item[4].item[0].answer[0].valueString = "120/80 mmHg"
* item[4].item[1].linkId = "hr"
* item[4].item[1].text = "Heart rate"
* item[4].item[1].answer[0].valueInteger = 72

* item[5].linkId = "q5"
* item[5].text = "Consent given"
* item[5].answer[0].valueBoolean = true

* item[6].linkId = "q6"
* item[6].text = "Clinician notes"
* item[6].answer[0].valueString = "No focal deficits. Advise hydration and rest."
