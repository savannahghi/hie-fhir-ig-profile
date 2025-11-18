Instance: HIEDiagnosticReport-example
InstanceOf: HIEDiagnosticReport
Usage: #example
Title: "Example HIE DiagnosticReport"
Description: "CBC panel with key hematology results"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>Diagnostic Report</b></p>
  <p>CBC panel completed. Results interpreted and finalized.</p>

  <p><b>Subject</b>: Jane Patient (Patient/p-001)</p>
  <p><b>Encounter</b>: Outpatient visit on 2025-11-12 (Encounter/enc-001)</p>

  <table>
    <thead>
      <tr>
        <th align="left">Code</th>
        <th align="left">Name</th>
        <th align="left">Value</th>
        <th align="left">Ref Range</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>718-7</td>
        <td>Hemoglobin [Mass/volume] in Blood</td>
        <td>12.4 g/dL</td>
        <td>12.0–16.0 g/dL</td>
      </tr>
      <tr>
        <td>6690-2</td>
        <td>Leukocytes [#/volume] in Blood</td>
        <td>7.2 ×10^3/µL</td>
        <td>4.0–11.0 ×10^3/µL</td>
      </tr>
    </tbody>
  </table>

  <p><b>Conclusion</b>: Findings consistent with normal CBC.</p>
  <p><b>Performer</b>: Acme Lab (Organization/org-001)</p>
  <p><b>Issued</b>: 2025-11-12T11:05:00+03:00</p>
</div>
"""

* identifier[0].use = #official
* identifier[0].system = "http://example.org/reports"
* identifier[0].value = "DR-2025-0001"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #ACSN
* identifier[0].type.coding[0].display = "Accession ID"

* status = #final

* category[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0074"
* category[0].coding[0].code = #LAB
* category[0].coding[0].display = "Laboratory"

* code.coding[0].system = "http://loinc.org"
* code.coding[0].code = #24323-8
* code.coding[0].display = "CBC panel - Hematology"

* subject.reference = "Patient/p-001"
* subject.display = "Jane Patient"

* encounter.reference = "Encounter/enc-001"
* encounter.display = "Outpatient visit 2025-11-12"

* basedOn[0].reference = "ServiceRequest/sr-001"
* basedOn[0].display = "CBC order"

* effectiveDateTime = "2025-11-12T10:40:00+03:00"
* issued = "2025-11-12T11:05:00+03:00"

* performer[0].reference = "Organization/org-001"
* performer[0].display = "Acme Lab"

* resultsInterpreter[0].reference = "Practitioner/pr-001"
* resultsInterpreter[0].display = "Dr. John Clinician"

* specimen[0].reference = "Specimen/spec-001"
* specimen[0].display = "Whole blood EDTA"

* result[0].reference = "Observation/obs-hb"
* result[0].display = "Hemoglobin"
* result[1].reference = "Observation/obs-wbc"
* result[1].display = "Leukocytes"

* media[0].comment = "Analyzer QC image"
* media[0].link.reference = "Media/media-1"
* media[0].link.display = "Analyzer QC image"

* conclusion = "Normal CBC."
* conclusionCode[0].coding[0].system = "http://snomed.info/sct"
* conclusionCode[0].coding[0].code = #281900007
* conclusionCode[0].coding[0].display = "Normal complete blood count"
