Instance: ExampleKenyaOrganizationR4B
InstanceOf: KenyaOrganizationR4B
Usage: #example
Description: "An example Organization resource conforming to the KenyaOrganizationR4B profile."

* identifier[0].use = #official
* identifier[0].type = #MFLCODE "MFL CODE"
* identifier[0].value = "123456789"
* identifier[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type[0].coding.code = #MFLCODE
* identifier[0].type[0].coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"

* active = true
* type = #prov "Healthcare Provider"
* name = "Kenyatta National Hospital"
* contact.purpose = #ADMIN "Administrative"
* contact.name.text = "Jane Doe"
* telecom[0].system = #phone
* telecom[0].value = "+254717355900"
* telecom[0].use = #work

