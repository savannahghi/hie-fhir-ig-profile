Profile: HIEEpisodeOfCare
Parent: EpisodeOfCare
Id: episode-of-care
Title: "EpisodeOfCare"
Description: "EpisodeOfCare is a HIE representation of EpisodeOfCare FHIR resource to be used with KHIE"
* ^version = "0.1.0-r4b"
* ^status = #active
* insert SharedIdentifierRules
* statusHistory MS
* managingOrganization	1.. 
* referralRequest MS
* careManager MS
* account MS
* diagnosis MS
* type 1..
* type from EpisodeOfCareServiceTypesVs