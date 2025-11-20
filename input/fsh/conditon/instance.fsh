Instance: HIECondition-example
InstanceOf: HIECondition
Usage: #example
Title: "Example HIE Condition"
Description: "Encounter diagnosis of headache, moderate severity"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>Condition Narrative</b></p>
  <p>Headache, active, confirmed, moderate severity.</p>

  <p><b>Patient</b></p>
  <ul>
    <li>Name: Jane Patient</li>
    <li>Reference: Patient/p-001</li>
  </ul>

  <p><b>Condition details</b></p>
  <table>
    <tbody>
      <tr>
        <td><b>Code</b></td>
        <td>Headache, SNOMED CT 25064002</td>
      </tr>
      <tr>
        <td><b>Clinical status</b></td>
        <td>Active</td>
      </tr>
      <tr>
        <td><b>Verification status</b></td>
        <td>Confirmed</td>
      </tr>
      <tr>
        <td><b>Category</b></td>
        <td>Encounter diagnosis</td>
      </tr>
      <tr>
        <td><b>Severity</b></td>
        <td>Moderate</td>
      </tr>
      <tr>
        <td><b>Body site</b></td>
        <td>Head structure, SNOMED CT 69536005</td>
      </tr>
    </tbody>
  </table>

  <p><b>Context</b></p>
  <ul>
    <li>Encounter: Ambulatory visit 2025-11-12, Encounter/enc-001</li>
    <li>Recorded date: 2025-11-12</li>
    <li>Onset: 2025-11-11T08:00:00+03:00</li>
  </ul>

  <p><b>Stage</b></p>
  <table>
    <tbody>
      <tr>
        <td><b>Summary</b></td>
        <td>Acute illness, SNOMED CT 241929008</td>
      </tr>
      <tr>
        <td><b>Type</b></td>
        <td>Episode</td>
      </tr>
      <tr>
        <td><b>Assessment</b></td>
        <td>Pain score NRS 6 out of 10, Observation/obs-001</td>
      </tr>
    </tbody>
  </table>

  <p><b>Evidence</b></p>
  <table>
    <thead>
      <tr>
        <th align="left">Code</th>
        <th align="left">Details</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Clinical examination, SNOMED CT 5880005</td>
        <td>Observation/obs-001, pain score NRS 6 out of 10</td>
      </tr>
    </tbody>
  </table>

  <p><b>Provenance</b></p>
  <ul>
    <li>Recorder: Dr. John Clinician, HIEPractitioner/pr-001</li>
    <li>Asserter: Jane Patient, Patient/p-001</li>
  </ul>

  <p><b>Notes</b></p>
  <ul>
    <li>Headache started yesterday morning, no red flags, managed with NSAIDs.</li>
  </ul>
</div>
"""

* identifier[0].use = #official
* identifier[0].system = "http://example.org/conditions"
* identifier[0].value = "COND-12345"
* identifier[0].type.text = "Condition ID"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #MR
* identifier[0].type.coding[0].display = "Medical record number"

* clinicalStatus.coding[0].system = "http://hl7.org/fhir/condition-clinical"
* clinicalStatus.coding[0].code = #active
* clinicalStatus.coding[0].display = "Active"

* verificationStatus.coding[0].system = "http://hl7.org/fhir/condition-ver-status"
* verificationStatus.coding[0].code = #confirmed
* verificationStatus.coding[0].display = "Confirmed"

* category[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category[0].coding[0].code = #encounter-diagnosis
* category[0].coding[0].display = "Encounter Diagnosis"

* severity.coding[0].system = "http://example.org/fhir/CodeSystem/hie-condition-severity-cs"
* severity.coding[0].code = #moderate
* severity.coding[0].display = "Moderate"

* code.coding[0].system = "http://snomed.info/sct"
* code.coding[0].code = #25064002
* code.coding[0].display = "Headache"

* bodySite[0].coding[0].system = "http://snomed.info/sct"
* bodySite[0].coding[0].code = #69536005
* bodySite[0].coding[0].display = "Head structure"

* subject.reference = "Patient/p-001"
* subject.display = "Jane Patient"

* encounter.reference = "Encounter/enc-001"
* encounter.display = "Ambulatory visit 2025-11-12"

* recordedDate = "2025-11-12"

* recorder.reference = "HIEPractitioner/pr-001"
* recorder.display = "Dr. John Clinician"

* asserter.reference = "Patient/p-001"
* asserter.display = "Jane Patient"

* onsetDateTime = "2025-11-11T08:00:00+03:00"

* stage[0].summary.coding[0].system = "http://snomed.info/sct"
* stage[0].summary.coding[0].code = #241929008
* stage[0].summary.coding[0].display = "Acute illness"
* stage[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/condition-stage"
* stage[0].type.coding[0].code = #episode
* stage[0].type.coding[0].display = "Episode"
* stage[0].assessment[0].reference = "Observation/obs-001"
* stage[0].assessment[0].display = "Pain score NRS 6/10"

* evidence[0].code[0].coding[0].system = "http://snomed.info/sct"
* evidence[0].code[0].coding[0].code = #5880005
* evidence[0].code[0].coding[0].display = "Clinical examination"
* evidence[0].detail[0].reference = "Observation/obs-001"
* evidence[0].detail[0].display = "Pain score NRS 6/10"

* note[0].authorReference = Reference(HIEPractitioner/pr-001)
* note[0].time = "2025-11-12T10:15:00+03:00"
* note[0].text = "Headache started yesterday morning, no red flags, managed with NSAIDs."
