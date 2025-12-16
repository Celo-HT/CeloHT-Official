SECURITY.md

CeloHT Security Policy

This document defines the security posture, scope, and responsible disclosure process for CeloHT.

CeloHT is a public‑interest Web3 platform. It is not a token, not a cryptocurrency, and does not conduct fundraising or ICOs.




1. Security Philosophy

CeloHT follows a Security‑by‑Design approach:

No token issuance

No user fund custody

No on‑chain treasury

Minimal, auditable smart‑contract surface

Open‑source by default


This dramatically reduces attack incentives and systemic risk.



2. In‑Scope Components

The following components are considered in scope for security review:

Smart contracts under /contracts

Deployment scripts under /scripts

CI/CD pipelines (.github/workflows)

Governance and registry logic





3. Out‑of‑Scope Components

The following are explicitly out of scope:

Third‑party wallets (e.g. Valora)

Celo blockchain infrastructure

External services or APIs

User devices or private keys





4. Smart Contract Security Controls

CeloHT smart contracts implement:

OpenZeppelin audited libraries

Role‑based access control (RBAC)

Emergency pause mechanism

Upgrade authorization guards

Event‑based transparency


No contract:

holds funds

mints assets

enables transfers of value





5. Upgrade & Admin Risk Management

All upgrades require explicit admin authorization

Admin roles are intended to be governed by a decentralized committee

Upgradeability exists for bug fixes and security improvements only


There is no mechanism for arbitrary value extraction.




6. Continuous Security Practices

CeloHT enforces:

Automated tests on every commit

Continuous Integration (CI)

Code reviews before merge

Public visibility of all changes





7. Responsible Disclosure

Security researchers are encouraged to report vulnerabilities responsibly.

Reporting Guidelines

Please include:

A clear description of the issue

Steps to reproduce

Potential impact


Contact

Report security issues via:

GitHub Issues (marked as security), or

Direct contact with the CeloHT core maintainers


Do not exploit vulnerabilities for personal gain.




8. No Bug Bounty / No Financial Incentives

CeloHT does not operate a bug bounty program.

Reason:

No token

No treasury

No fundraising


Contributions are recognized publicly, not financially.




9. Legal Disclaimer

CeloHT is provided as‑is, without warranty.

Users interact with the platform at their own risk.

CeloHT assumes no liability for:

external wallet failures

blockchain network issues

third‑party service disruptions





Final Statement

CeloHT prioritizes transparency, safety, and long‑term trust over complexity or speculation.

Security is not a feature — it is the foundation.



CeloHT Open‑source • Public‑interest • Security‑first