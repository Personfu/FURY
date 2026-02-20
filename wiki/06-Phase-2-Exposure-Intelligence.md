# Chapter 06: Phase 2 — Exposure Intelligence

## Analyzing the Digital Shadow

**Phase 2** moves into semi-passive interaction. We analyze how the target's infrastructure exposes itself to the public internet.

### Exposure Vectors

- **Service Enumeration**: Identifying running services via `Naabu` and `Masscan`.
- **Infrastructure Fingerprinting**: Analyzing TLS certificates, header anomalies, and DNS records.
- **Data Leakage**: Finding misconfigured S3 buckets, exposed `.git` directories, and open CI/CD pipelines.

### The FURY Advantage

Using `fury-stealth`, we wrap our enumeration in environment evasion layers, ensuring that our infrastructure analysis remains undetectable by most automated defense systems.

---
[[05-Phase-1-Passive-OSINT-Fusion]] | [[Home]] | [[07-Phase-3-Precision-Validation]]
