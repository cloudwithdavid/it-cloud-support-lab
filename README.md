# Support Engineering Lab <img src="docs/assets/status-active-lab.gif" alt="Status: active lab" align="right" width="100">
<!--
- [About](#about)
- [What This Lab Demonstrates](#what-this-lab-demonstrates)
  - [Support Case Handling](#support-case-handling)
  - [Support-Oriented Tooling](#support-oriented-tooling)
- [Case Handling Workflow](#case-handling-workflow)
- [Artifacts](#artifacts)
  - [Tickets](#tickets)
  - [KB Articles](#kb-articles)
  - [Runbooks](#runbooks)
  - [Bash Scripts](#bash-scripts)
  - [Python Scripts](#python-scripts)
- [Repository Structure](#repository-structure)
-->

## About

This is a support engineering lab with a focus on operations and automation, built around simulated ticket case handling, and support-oriented Bash/Python tooling.

Its purpose is to develop support judgment, practical CLI use, troubleshooting workflow, documentation clarity, and small operational utilities that make common support work more technical and repeatable.

The lab combines two connected layers of practice:

- **support case handling** through tickets, KB articles, runbooks, and practical CLI troubleshooting
- **support-oriented tooling** through Bash and Python scripts tied to troubleshooting and evidence-gathering tasks

## What This Lab Demonstrates

### Support Case Handling

- structured support case analysis through realistic scenarios, issue patterns, and troubleshooting paths
- command-line checks used to gather evidence and narrow support issues
- reusable support documentation that captures reasoning, outcomes, handoff decisions, and lessons learned

### Support-Oriented Tooling

- log, service, and health-oriented check creation
- technical evidence collection, formatting, and organization for ticket documentation
- repetitive task automation tied to Linux and networking cases using Bash and Python scripting

## Support Case Workflow

Cases are worked through as guided support scenarios.

Each case starts with a realistic ticket briefing, then moves through the relevant issue pattern, troubleshooting path, documentation logic, and possible escalation decision. Final artifacts are rewritten in clear junior-level support wording to show the symptom, checks, findings, outcome, and lesson learned.

This keeps the lab focused on support judgment, troubleshooting workflow, documentation clarity, and practical tooling.

## Artifacts

> This is an active lab. New items are being added as the lab develops.

### Tickets

Primary case-handling records used to practice issue framing, classification, hypotheses, checks, resolution versus escalation decisions, verification, and debriefing.

- [`linux/service-will-not-start.md`](https://github.com/cloudwithdavid/support-eng-lab/blob/main/docs/tickets/linux/service-will-not-start.md)
- [`identity-access/password-reset-access-loss.md`](https://github.com/cloudwithdavid/support-eng-lab/blob/main/docs/tickets/identity-access/password-reset-access-loss.md)
- [`identity-access/account-unlock-root-cause.md`](https://github.com/cloudwithdavid/support-eng-lab/blob/main/docs/tickets/identity-access/account-unlock-root-cause.md)
- [`windows-endpoint/no-internet-dns-failure.md`](https://github.com/cloudwithdavid/support-eng-lab/blob/main/docs/tickets/windows-endpoint/no-internet-dns-failure.md)
- [`windows-endpoint/application-install-blocked.md`](https://github.com/cloudwithdavid/support-eng-lab/blob/main/docs/tickets/windows-endpoint/application-install-blocked.md)
- [`windows-endpoint/slow-pc.md`](https://github.com/cloudwithdavid/support-eng-lab/blob/main/docs/tickets/windows-endpoint/slow-pc.md)
- [`microsoft-365/m365-license-assignment.md`](https://github.com/cloudwithdavid/support-eng-lab/blob/main/docs/tickets/microsoft-365/M365-license-assignment.md)

### KB Articles

Reusable references that document repeatable issue patterns for future support work.

- [`no-internet-dns-failure.md`](https://github.com/cloudwithdavid/support-eng-lab/blob/main/docs/kb/no-internet-dns-failure.md)
- [`password-reset-access-loss.md`](https://github.com/cloudwithdavid/support-eng-lab/blob/main/docs/kb/password-reset-access-loss.md)

### Runbooks

Stepwise operational guides that standardize repeated support workflows and escalation logic.

-

### Bash Scripts

Bash scripts used to reduce repetitive manual troubleshooting work in selected Linux and networking cases.

-

### Python Scripts

Python scripts used to automate support and troubleshooting tasks in selected Linux and networking cases.

-

## Repository Structure

- [`docs/tickets/`](https://github.com/cloudwithdavid/support-eng-lab/tree/main/docs/tickets) → simulated support cases
- [`docs/kb/`](https://github.com/cloudwithdavid/support-eng-lab/tree/main/docs/kb) → KB articles for repeatable issue patterns
- [`docs/runbooks/`](https://github.com/cloudwithdavid/support-eng-lab/tree/main/docs/runbooks) → runbooks for repeatable support workflows
- [`tools/bash/`](https://github.com/cloudwithdavid/support-eng-lab/tree/main/tools/bash) → Bash scripts for common support and troubleshooting tasks
- [`tools/python/`](https://github.com/cloudwithdavid/support-eng-lab/tree/main/tools/python) → Python scripts for common support and troubleshooting tasks
<!--
- `tools/samples/` → sample files used for script testing
-->
