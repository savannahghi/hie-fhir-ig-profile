Profile: KenyaEpisodeOfCareR4B
Parent: EpisodeOfCare
Id: kenya-episode-of-care
Title: "Kenya R4B EpisodeOfCare"
Description: "EpisodeOfCare is a Kenya HIE representation of EpisodeOfCare FHIR resource to be used with KHIE"
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
* type from KenyaEpisodeOfCareR4BServiceTypesVs