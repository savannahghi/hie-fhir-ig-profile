// Profile: KenyaPatient
// Parent: Patient
// Id: sghi-patient
// Title: "SGHI Patient"
// Description: "Demographics and other administrative information about an individual or animal receiving care or other health-related services."
// * identifier 1..*
//   * type only HIECodeableConcept
//   * type from SGHIPatientIdentifierTypes (required)
//   * use from $identifier-use (required)
//   * value 1..1
//   * system 1..1
//   * assigner 1..1
//   * assigner only HIEReference
//   * assigner only Reference(Organization) // Replace with Profiled Org

// * text 0..1
// * active 1..1

// * name 1..1
// * name only HIEHumanName

// * telecom 1..*
// * telecom only HIEContactPoint

// * gender 1..1 
// * birthDate 1..1 

// * contact 0..*
//   * relationship 1..* 
//   * relationship only HIECodeableConcept
//   * relationship from HIEContactRelationship (required)
//   * name 1..1
//   * name only HIEHumanName
//   * telecom 1..1
//   * telecom only HIEContactPoint
//   * organization only HIEReference
//   * organization only Reference(Organization) // Replace with Profiled Org

// * managingOrganization 1..1
// * managingOrganization only HIEReference
// * managingOrganization only Reference(Organization) // Replace with Profiled Org

// * generalPractitioner only HIEReference
// * generalPractitioner only Reference(Organization) // Replace with Profiled Org

// * link.other only HIEReference
// * link.other only Reference(SGHIPatient) // Replace with Profiled Patient
