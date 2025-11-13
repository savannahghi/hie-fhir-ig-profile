# **SIL HIE FHIR Profile Implementation Guide**

## **Overview**

Welcome to the **SIL HIE FHIR Profile Implementation Guide (IG)** — a comprehensive resource designed to support the consistent, interoperable, and standards-based exchange of healthcare data within the **SIL Health Information Exchange (HIE)** ecosystem.

This guide defines **SIL-specific FHIR profiles**, **extensions**, **terminologies**, and **implementation patterns** to promote **seamless data exchange** across healthcare systems that participate in SIL’s digital health infrastructure. It aims to ensure that all implementers — whether integrating EMRs, HIS systems, mobile apps, or data analytics platforms — speak a common language when exchanging FHIR-based data.

---

## **Purpose**

The purpose of this Implementation Guide is to:

* Define and document **FHIR resource profiles** customized for SIL’s interoperability needs.
* Provide **implementation guidance**, **examples**, and **conformance rules** for consistent adoption.
* Enable **system architects, developers, and integrators** to build and validate systems against SIL HIE standards.
* Foster **data quality**, **semantic consistency**, and **compatibility** across all connected systems.

By using this IG, implementers can standardize how key healthcare entities such as **Patients**, **Encounters**, **Practitioners**, **Observations**, and **ServiceRequests** are represented, validated, and exchanged.

---

## **Scope**

This guide covers:

* **FHIR Resource Profiles** for key clinical and administrative data entities.
* **ValueSets** and **CodeSystems** aligned with SIL and Kenyan Ministry of Health standards.
* **Implementation Examples** demonstrating real-world usage.
* **Conformance Requirements** ensuring systems meet SIL interoperability expectations.
* **Versioning and Compatibility Rules** between R4B and R5 releases.

---

## **FHIR Versions Supported**

This guide includes parallel FHIR profile definitions for:

* **R4B** – ensuring backward compatibility with existing systems.

---

## **How to Build the Implementation Guide**

1. **Install SUSHI (FHIR Shorthand compiler)**

   ```bash
   npm install -g fsh-sushi
   ```

2. **Build the IG for a specific FHIR version**

   ```bash
   make ig
   ```

   The resulting site will be generated in `output/` under the respective version directory.

3. **Preview the IG locally:**
   Open the generated `index.html` in your browser to explore the guide.

---

## **Contribution and Feedback**

The **SIL FHIR IG** is an open collaboration between SIL teams, implementers, and partner organizations. Contributions and feedback are highly encouraged.

* Repository: [SIL FHIR Profile Implementation Guide GitHub](https://github.com/savannahghi/hie-fhir-ig-profile)
* Issues & Discussions: Use GitHub Issues for reporting bugs, proposing changes, or requesting new profiles.

---

## **Acknowledgements**

This guide has been developed and maintained by the **Savannah Informatics Life Sciences Team** in alignment with global FHIR standards and national digital health priorities. Special thanks to contributors across SIL who continue to support interoperability and innovation in healthcare for seamless data exchange.
