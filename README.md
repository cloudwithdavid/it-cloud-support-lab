# Support Engineering Lab

## ℹ️ About

This is a support engineering lab with a focus on operations and automation, built around simulated ticket case handling, and support-oriented Bash/Python tooling.

Its purpose is to develop support judgment, practical CLI use, troubleshooting workflow, documentation clarity, and small operational utilities that make common support work more technical and repeatable.

The lab combines two connected layers of practice:

- **support case handling** through tickets, KB articles, runbooks, and practical CLI troubleshooting
- **support-oriented tooling** through Bash and Python scripts tied to troubleshooting workflows

## 🧪 What This Lab Demonstrates

### 🔎 Support Case Handling

- structured support case analysis through realistic scenarios, issue patterns, and troubleshooting paths
- command-line checks used to gather evidence and narrow support issues
- reusable support documentation that captures reasoning, outcomes, handoff decisions, and lessons learned

### ⚙️ Support-Oriented Tooling

- log, service, and health-oriented check creation
- technical evidence collection, formatting, and organization for ticket documentation
- repetitive task automation tied to Linux and networking cases using Bash and Python scripting

## 🔄 Support Case Workflow

Cases are worked through as guided support scenarios.

Each case starts with a realistic ticket briefing, then moves through the relevant issue pattern, troubleshooting path, documentation logic, and possible escalation decision. Final artifacts are rewritten in clear junior-level support wording to show the symptom, checks, findings, outcome, and lesson learned.

This keeps the lab focused on support judgment, troubleshooting workflow, documentation clarity, and practical tooling.

## 📦 Artifacts

> This is an active lab. New items are being added as the lab develops.

### 🎫 Ticket Cases

Primary case-handling records used to practice issue framing, classification, hypotheses, checks, resolution versus escalation decisions, verification, and debriefing.

- [`networking/invalid-default-route.md`](docs/tickets/networking/invalid-default-route.md)
- [`linux/service-will-not-start.md`](docs/tickets/linux/service-will-not-start.md)
- [`identity-access/password-reset-access-loss.md`](docs/tickets/identity-access/password-reset-access-loss.md)
- [`identity-access/account-unlock-root-cause.md`](docs/tickets/identity-access/account-unlock-root-cause.md)
- [`windows-endpoint/no-internet-dns-failure.md`](docs/tickets/windows-endpoint/no-internet-dns-failure.md)
- [`windows-endpoint/application-install-blocked.md`](docs/tickets/windows-endpoint/application-install-blocked.md)
- [`windows-endpoint/slow-pc.md`](docs/tickets/windows-endpoint/slow-pc.md)
- [`microsoft-365/m365-license-assignment.md`](docs/tickets/microsoft-365/M365-license-assignment.md)

### 📚 KB Articles

Reusable references that document repeatable issue patterns for future support work.

- [`no-internet-dns-failure.md`](docs/kb/no-internet-dns-failure.md)
- [`password-reset-access-loss.md`](docs/kb/password-reset-access-loss.md)

### 📋 Runbooks

Stepwise operational guides that standardize repeated support workflows and escalation logic.

-

### 🐚 Bash Scripts

Bash scripts used to reduce repetitive manual troubleshooting work.

- [`evidence-collect.sh`](tools/bash/evidence-collect.sh)

### 🐍 Python Scripts

Python scripts used to automate support and troubleshooting tasks.

-

## 🗂️ Repository Structure

- [`docs/tickets/`](docs/tickets/) → simulated support cases
- [`docs/kb/`](docs/kb/) → KB articles for repeatable issue patterns
- [`docs/runbooks/`](docs/runbooks/) → runbooks for repeatable support workflows
- [`tools/bash/`](tools/bash/) → Bash scripts for common support and troubleshooting tasks
- [`tools/python/`](tools/python/) → Python scripts for common support and troubleshooting tasks
<!--
- [`tools/samples/`](tools/samples/) → sample files used for script testing
-->
