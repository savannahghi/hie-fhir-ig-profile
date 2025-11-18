ValueSet: ICD11Codes
Id: ICD11Codes
Title: "All ICD-11 codes"
Description: "All codes from ICD-11"
* ^status = #active
* include codes from system http://id.who.int/icd/release/11/mms

ValueSet: HIEConditionSeverity
Id: hie-condition-severity
Title: "HIE Condition Severity"
Description: "Local ValueSet of condition severity."
* ^status = #active
* include HIEConditionSeverityCS#mild "Mild"
* include HIEConditionSeverityCS#moderate "Moderate"
* include HIEConditionSeverityCS#severe "Severe"