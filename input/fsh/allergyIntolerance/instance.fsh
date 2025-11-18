Instance: HIEAllergyIntolerance-example
InstanceOf: HIEAllergyIntolerance
Usage: #example
Title: "Example HIE AllergyIntolerance"
Description: "Peanut allergy with urticaria reaction"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>AllergyIntolerance Narrative</b></p>
  <p>Confirmed peanut allergy. Active. High criticality. Urticaria after oral exposure.</p>

  <p><b>Patient</b></p>
  <ul>
    <li>Name: Jane Patient</li>
    <li>Reference: Patient/p-001</li>
  </ul>

  <p><b>Allergy details</b></p>
  <table>
    <tbody>
      <tr>
        <td><b>Substance</b></td>
        <td>Peanut (SNOMED CT 227493005)</td>
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
        <td><b>Type</b></td>
        <td>Allergy</td>
      </tr>
      <tr>
        <td><b>Category</b></td>
        <td>Food</td>
      </tr>
      <tr>
        <td><b>Criticality</b></td>
        <td>High</td>
      </tr>
    </tbody>
  </table>

  <p><b>Encounter</b></p>
  <ul>
    <li>Context: Ambulatory visit for rash</li>
    <li>Reference: Encounter/enc-001</li>
  </ul>

  <p><b>Timeline</b></p>
  <table>
    <tbody>
      <tr>
        <td><b>Recorded</b></td>
        <td>2025-11-10</td>
      </tr>
      <tr>
        <td><b>Onset</b></td>
        <td>2018-03-15T14:10:00+03:00</td>
      </tr>
      <tr>
        <td><b>Most recent event</b></td>
        <td>2025-11-09T13:00:00+03:00</td>
      </tr>
    </tbody>
  </table>

  <p><b>Reaction history</b></p>
  <table>
    <thead>
      <tr>
        <th align="left">Date</th>
        <th align="left">Manifestation</th>
        <th align="left">Severity</th>
        <th align="left">Exposure route</th>
        <th align="left">Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>2025-11-09T13:00:00+03:00</td>
        <td>Urticaria (SNOMED CT 271807003)</td>
        <td>Moderate</td>
        <td>Oral route (SNOMED CT 26643006)</td>
        <td>Generalized hives and pruritus</td>
      </tr>
    </tbody>
  </table>

  <p><b>Notes</b></p>
  <ul>
    <li>2025-11-10T09:30:00+03:00 by Dr. John Clinician: Patient reports hives within 30 minutes of ingesting peanuts, carries epinephrine auto-injector.</li>
    <li>2025-11-10T09:35:00+03:00 by Dr. John Clinician: Resolved with oral antihistamine. No respiratory compromise.</li>
  </ul>

  <p><b>Provenance</b></p>
  <ul>
    <li>Recorder: Dr. John Clinician, Practitioner/pr-001</li>
    <li>Asserter: Jane Patient, Patient/p-001</li>
  </ul>

  <p><b>Care guidance</b></p>
  <ul>
    <li>Avoid peanut exposure.</li>
    <li>Carry and know how to use an epinephrine auto-injector.</li>
    <li>Seek urgent care for respiratory symptoms, hypotension, or widespread hives.</li>
  </ul>
</div>
"""

* identifier[0].use = #official
* identifier[0].system = "http://example.org/mrn"
* identifier[0].value = "MRN-12345"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #MR
* identifier[0].type.coding[0].display = "Medical record number"

* clinicalStatus.coding[0].system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
* clinicalStatus.coding[0].code = #active
* clinicalStatus.coding[0].display = "Active"

* verificationStatus.coding[0].system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
* verificationStatus.coding[0].code = #confirmed
* verificationStatus.coding[0].display = "Confirmed"

* type = #allergy
* category[0] = #food
* criticality = #high

* code.coding[0].system = "http://snomed.info/sct"
* code.coding[0].code = #227493005
* code.coding[0].display = "Peanut"

* patient.reference = "Patient/p-001"
* patient.display = "Jane Patient"
* encounter.reference = "Encounter/enc-001"
* encounter.display = "Ambulatory visit for rash"

* recordedDate = "2025-11-10"
* recorder.reference = "Practitioner/pr-001"
* recorder.display = "Dr. John Clinician"
* asserter.reference = "Patient/p-001"
* asserter.display = "Jane Patient"

* note[0].authorReference = Reference(Practitioner/pr-001)
* note[0].time = "2025-11-10T09:30:00+03:00"
* note[0].text = "Patient reports hives within 30 minutes of ingesting peanuts; carries epinephrine auto-injector."

* reaction[0].substance.coding[0].system = "http://snomed.info/sct"
* reaction[0].substance.coding[0].code = #227493005
* reaction[0].substance.coding[0].display = "Peanut"

* reaction[0].manifestation[0].coding[0].system = "http://snomed.info/sct"
* reaction[0].manifestation[0].coding[0].code = #271807003
* reaction[0].manifestation[0].coding[0].display = "Urticaria"

* reaction[0].description = "Generalized hives and pruritus"
* reaction[0].onset = "2025-11-09T13:00:00+03:00"
* reaction[0].severity = #moderate

* reaction[0].exposureRoute.coding[0].system = "http://snomed.info/sct"
* reaction[0].exposureRoute.coding[0].code = #26643006
* reaction[0].exposureRoute.coding[0].display = "Oral route"

* reaction[0].note[0].authorReference = Reference(Practitioner/pr-001)
* reaction[0].note[0].time = "2025-11-10T09:35:00+03:00"
* reaction[0].note[0].text = "Resolved with oral antihistamine. No respiratory compromise."