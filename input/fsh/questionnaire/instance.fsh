Instance: HIEQuestionnaire-example
InstanceOf: HIEQuestionnaire
Usage: #example
Title: "Example HIE Questionnaire"
Description: "HIE questionnaire for demographics, symptoms, and visit intent"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>Questionnaire Summary</b></p>
  <p>This form captures demographics, symptom screening, and appointment intent. Items are grouped for usability, typed for consistent capture, and use enableWhen for conditional logic.</p>

  <ul>
    <li>Status: active</li>
    <li>Versioned URL: http://example.org/Questionnaire/hie-q-example</li>
    <li>Root groups: Demographics, Symptoms, Visit</li>
  </ul>

  <p><b>Key Behaviors</b></p>
  <ul>
    <li>Unique linkIds across all items</li>
    <li>Group items carry no answers or initial values</li>
    <li>Non-group items define answer options or value sets when appropriate</li>
    <li>Conditional item appears only when gender = female</li>
  </ul>
</div>
"""

* status = #active
* url = "http://example.org/Questionnaire/hie-q-example"
* name = "HIE_Q_Demo_Symptoms_Visit"
* title = "HIE Intake Questionnaire"
* date = "2025-11-20"
* description = "Intake questionnaire capturing demographics, core symptoms, and visit intent for HIE workflows."

* identifier[0].use = #official
* identifier[0].system = "http://example.org/questionnaires"
* identifier[0].value = "Q-INTAKE-001"
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #ACSN
* identifier[0].type.coding[0].display = "Accession ID"

* subjectType[0] = #Patient

* item[0].linkId = "grp-demographics"
* item[0].text = "Demographics"
* item[0].type = #group

* item[0].item[0].linkId = "given-name"
* item[0].item[0].text = "Given name"
* item[0].item[0].type = #string
* item[0].item[0].required = true
* item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[0].item[0].extension[0].valueCodeableConcept.coding[0].system = "http://hl7.org/fhir/questionnaire-item-control"
* item[0].item[0].extension[0].valueCodeableConcept.coding[0].code = #text-box
* item[0].item[0].extension[0].valueCodeableConcept.coding[0].display = "Text box"

* item[0].item[1].linkId = "family-name"
* item[0].item[1].text = "Family name"
* item[0].item[1].type = #string
* item[0].item[1].required = true

* item[0].item[2].linkId = "gender"
* item[0].item[2].text = "Gender"
* item[0].item[2].type = #choice
* item[0].item[2].required = true
* item[0].item[2].answerOption[0].valueCoding.system = "http://hl7.org/fhir/administrative-gender"
* item[0].item[2].answerOption[0].valueCoding.code = #female
* item[0].item[2].answerOption[0].valueCoding.display = "Female"
* item[0].item[2].answerOption[1].valueCoding.system = "http://hl7.org/fhir/administrative-gender"
* item[0].item[2].answerOption[1].valueCoding.code = #male
* item[0].item[2].answerOption[1].valueCoding.display = "Male"
* item[0].item[2].answerOption[2].valueCoding.system = "http://hl7.org/fhir/administrative-gender"
* item[0].item[2].answerOption[2].valueCoding.code = #other
* item[0].item[2].answerOption[2].valueCoding.display = "Other"
* item[0].item[2].answerOption[3].valueCoding.system = "http://hl7.org/fhir/administrative-gender"
* item[0].item[2].answerOption[3].valueCoding.code = #unknown
* item[0].item[2].answerOption[3].valueCoding.display = "Unknown"
* item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[0].item[2].extension[0].valueCodeableConcept.coding[0].system = "http://hl7.org/fhir/questionnaire-item-control"
* item[0].item[2].extension[0].valueCodeableConcept.coding[0].code = #drop-down
* item[0].item[2].extension[0].valueCodeableConcept.coding[0].display = "Drop down"

* item[1].linkId = "grp-symptoms"
* item[1].text = "Symptoms"
* item[1].type = #group

* item[1].item[0].linkId = "has-headache"
* item[1].item[0].text = "Headache present"
* item[1].item[0].type = #boolean

* item[1].item[1].linkId = "headache-severity"
* item[1].item[1].text = "Headache severity"
* item[1].item[1].type = #choice
* item[1].item[1].enableWhen[0].question = "has-headache"
* item[1].item[1].enableWhen[0].operator = #=
* item[1].item[1].enableWhen[0].answerBoolean = true
* item[1].item[1].answerOption[0].valueCoding.system = "http://example.org/vs/severity"
* item[1].item[1].answerOption[0].valueCoding.code = #mild
* item[1].item[1].answerOption[0].valueCoding.display = "Mild"
* item[1].item[1].answerOption[1].valueCoding.system = "http://example.org/vs/severity"
* item[1].item[1].answerOption[1].valueCoding.code = #moderate
* item[1].item[1].answerOption[1].valueCoding.display = "Moderate"
* item[1].item[1].answerOption[2].valueCoding.system = "http://example.org/vs/severity"
* item[1].item[1].answerOption[2].valueCoding.code = #severe
* item[1].item[1].answerOption[2].valueCoding.display = "Severe"

* item[1].item[2].linkId = "pregnancy-status"
* item[1].item[2].text = "Are you currently pregnant?"
* item[1].item[2].type = #boolean
* item[1].item[2].enableWhen[0].question = "gender"
* item[1].item[2].enableWhen[0].operator = #=
* item[1].item[2].enableWhen[0].answerCoding.system = "http://hl7.org/fhir/administrative-gender"
* item[1].item[2].enableWhen[0].answerCoding.code = #female
* item[1].item[2].enableWhen[0].answerCoding.display = "Female"

* item[2].linkId = "grp-visit"
* item[2].text = "Visit"
* item[2].type = #group

* item[2].item[0].linkId = "visit-intent"
* item[2].item[0].text = "Reason for visit"
* item[2].item[0].type = #choice
* item[2].item[0].required = true
* item[2].item[0].answerOption[0].valueCoding.system = "http://example.org/vs/visit-intent"
* item[2].item[0].answerOption[0].valueCoding.code = #new-consult
* item[2].item[0].answerOption[0].valueCoding.display = "New consultation"
* item[2].item[0].answerOption[1].valueCoding.system = "http://example.org/vs/visit-intent"
* item[2].item[0].answerOption[1].valueCoding.code = #follow-up
* item[2].item[0].answerOption[1].valueCoding.display = "Follow up"
* item[2].item[0].answerOption[2].valueCoding.system = "http://example.org/vs/visit-intent"
* item[2].item[0].answerOption[2].valueCoding.code = #procedure
* item[2].item[0].answerOption[2].valueCoding.display = "Procedure"

* item[2].item[1].linkId = "requested-window"
* item[2].item[1].text = "Preferred appointment window"
* item[2].item[1].type = #choice

* item[2].item[2].linkId = "additional-notes"
* item[2].item[2].text = "Additional notes"
* item[2].item[2].type = #text
