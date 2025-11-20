Instance: HIEDocumentReference-example
InstanceOf: HIEDocumentReference
Usage: #example
Title: "Example HIE DocumentReference"
Description: "Discharge summary PDF for outpatient encounter"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>DocumentReference</b></p>
  <p>Discharge summary available as a PDF. Authored by Acme Health, authenticated by Dr. John Clinician, and linked to the referenced encounter and patient.</p>
  <table>
    <thead>
      <tr>
        <th align="left">Field</th>
        <th align="left">Value</th>
      </tr>
    </thead>
    <tbody>
      <tr><td>Status</td><td>current</td></tr>
      <tr><td>Doc Status</td><td>final</td></tr>
      <tr><td>Type</td><td>Discharge summary (LOINC 18842-5)</td></tr>
      <tr><td>Subject</td><td>Jane Patient (Patient/p-001)</td></tr>
      <tr><td>Date</td><td>2025-11-12T11:20:00+03:00</td></tr>
      <tr><td>Author</td><td>Acme Health (Organization/org-001)</td></tr>
      <tr><td>Authenticator</td><td>Dr. John Clinician (HIEPractitioner/pr-001)</td></tr>
      <tr><td>Encounter</td><td>Outpatient visit (Encounter/enc-001)</td></tr>
      <tr><td>Attachment</td><td>application/pdf, 256 KB, title "Discharge Summary", URL Binary/bin-001</td></tr>
    </tbody>
  </table>
</div>
"""

* identifier[0].use = #official
* identifier[0].system = "http://example.org/docrefs"
* identifier[0].value = "DOC-2025-0001"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #ACSN
* identifier[0].type.coding[0].display = "Accession ID"

* status = #current
* docStatus = #final

* type.coding[0].system = "http://loinc.org"
* type.coding[0].code = #18842-5
* type.coding[0].display = "Discharge summary"
* category[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0074"
* category[0].coding[0].code = #ADR
* category[0].coding[0].display = "Administrative/summary report"

* subject.reference = "Patient/p-001"
* subject.display = "Jane Patient"

* date = "2025-11-12T11:20:00+03:00"

* author[0].reference = "Organization/org-001"
* author[0].display = "Acme Health"
* authenticator.reference = "HIEPractitioner/pr-001"
* authenticator.display = "Dr. John Clinician"
* custodian.reference = "Organization/org-001"
* custodian.display = "Acme Health"

* securityLabel[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-Confidentiality"
* securityLabel[0].coding[0].code = #N
* securityLabel[0].coding[0].display = "normal"

* content[0].attachment.contentType = #application/pdf
* content[0].attachment.url = "Binary/bin-001"
* content[0].attachment.title = "Discharge Summary"
* content[0].attachment.creation = "2025-11-12T11:15:00+03:00"
* content[0].attachment.size = 262144
* content[0].attachment.hash = "3q2+7w=="

* context.encounter.reference = "Encounter/enc-001"
* context.encounter.display = "Outpatient visit 2025-11-12"
* context.facilityType.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* context.facilityType.coding[0].code = #OUTPHARM
* context.facilityType.coding[0].display = "Outpatient facility"
* context.practiceSetting.coding[0].system = "http://snomed.info/sct"
* context.practiceSetting.coding[0].code = #408443003
* context.practiceSetting.coding[0].display = "General medical practice"
* context.sourcePatientInfo.reference = "Patient/p-001"
* context.sourcePatientInfo.display = "Jane Patient"

* relatesTo[0].code = #replaces
* relatesTo[0].target.reference = "DocumentReference/doc-older-0001"
* relatesTo[0].target.display = "Prior discharge summary"
