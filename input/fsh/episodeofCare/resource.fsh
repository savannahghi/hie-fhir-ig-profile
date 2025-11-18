Profile: HIEEpisodeOfCare
Parent: EpisodeOfCare
Id: hie-episode-of-care
Title: "HIE EpisodeOfCare"
Description: "EpisodeOfCare is the representation of EpisodeOfCare FHIR resource to be used with national HIE"
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
* type from HIEEpisodeOfCareServiceTypesVs