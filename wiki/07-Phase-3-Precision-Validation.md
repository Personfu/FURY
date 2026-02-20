# Chapter 07: Phase 3 — Precision Validation

## Moving from Artifacts to Evidence

Validation is where OSINT becomes intelligence. We verify that a discovered exposure is indeed a risk.

### Validation Techniques

- **Technical Verification**: Confirming service versions and configurations match discovered signatures.
- **Logic Testing**: Observing how applications handle specific (authorized) requests to validate logical exposure.
- **Evidence Formatting**: Capturing cryptographically verifiable evidence of exposure for reporting.

### Tools for Precision

- **Nuclei**: Running specific, targeted templates to validate vulnerabilities.
- **HTTPX**: Probing for specific logical paths and header responses.
- **Wireshark**: Analyzing outbound traffic during validation to ensure no sensitive data is leaked during the process.

---
[[06-Phase-2-Exposure-Intelligence]] | [[Home]] | [[08-Beyond-CVEs-Vulnerability-Intelligence]]
