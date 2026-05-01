# Support Engineering Lab

## ℹ️ About

This is a support engineering lab focused on operations and automation, built around **simulated** support case handling and support-oriented Bash and Python tooling.

The lab develops structured troubleshooting judgment, practical CLI fluency, documentation clarity, and operational scripting that make support work more technical and repeatable.

## 🧪 Lab Coverage

### 🔎 Support Case Handling

- structured triage and troubleshooting across Linux, networking, identity, and endpoint domains
- CLI-driven evidence gathering to isolate and document real issue patterns
- support documentation (tickets, KB articles, and runbooks) that captures reasoning, findings, and escalation decisions in reusable form

### ⚙️ Support-Oriented Tooling

- Bash and Python scripts that automate evidence collection, health checks, log analysis, and connectivity across real troubleshooting scenarios
- Tools built to reduce repetitive manual work and produce ticket-ready output

## 📦 Artifacts

### 🎫 Support Cases

Primary case-handling records used to practice issue framing, triage, troubleshooting, resolution versus escalation decisions, and documentation.
<!-- markdownlint-disable MD060 -->
|                                    |                                     |
| ---------------------------------- | ----------------------------------- |
| **Linux** | • [`service-will-not-start.md`](docs/tickets/linux/service-will-not-start.md) |
| **Networking** | • [`invalid-default-route.md`](docs/tickets/networking/invalid-default-route.md) |
| **Identity & Access** | • [`password-reset-access-loss.md`](docs/tickets/identity-access/password-reset-access-loss.md)<br> • [`account-unlock-root-cause.md`](docs/tickets/identity-access/account-unlock-root-cause.md)<br> • [`policy-blocked-sign-in.md`](docs/tickets/identity-access/policy-blocked-sign-in.md) |
| **Windows Endpoint** | • [`no-internet-dns-failure.md`](docs/tickets/windows-endpoint/no-internet-dns-failure.md)<br> • [`application-install-blocked.md`](docs/tickets/windows-endpoint/application-install-blocked.md)<br> • [`slow-pc.md`](docs/tickets/windows-endpoint/slow-pc.md) |
| **Microsoft 365** | • [`m365-license-assignment.md`](docs/tickets/microsoft-365/M365-license-assignment.md) |

### 📚 KB Articles

Reusable references that document repeatable issue patterns for future support work.

- [`no-internet-dns-failure.md`](docs/kb/no-internet-dns-failure.md)
- [`password-reset-access-loss.md`](docs/kb/password-reset-access-loss.md)

### 📋 Runbooks

Stepwise operational guides that standardize repeated support workflows and escalation logic.

**Planned:** `identity-sign-in-triage-runbook.md`

### 🐚 Bash Scripts

Bash scripts used to reduce repetitive manual troubleshooting work.

- [`evidence-collect.sh`](tools/bash/evidence-collect.sh) — reusable first-pass Linux evidence collection. Accepts an optional service name, URL, and/or IP address. Collects host, disk, service, journal, port, routing, and reachability evidence, and writes results to a timestamped file for ticket attachment or escalation reference.

### 🐍 Python Scripts

Python scripts used to automate support and troubleshooting tasks.

**Planned:** `bulk_connectivity_check.py`

## 🗂️ Repository Structure

- [`docs/tickets/`](docs/tickets/) → simulated support cases
- [`docs/kb/`](docs/kb/) → KB articles for repeatable issue patterns
- [`docs/runbooks/`](docs/runbooks/) → runbooks for repeatable support workflows
- [`tools/bash/`](tools/bash/) → Bash scripts for common support and troubleshooting tasks
- [`tools/python/`](tools/python/) → Python scripts for common support and troubleshooting tasks
<!--
- [`tools/samples/`](tools/samples/) → sample files used for script testing
-->
