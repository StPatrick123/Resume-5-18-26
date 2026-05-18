---
name: "Ada Lovelace"
title: "Principal Software Engineer"
email: "ada@example.com"
phone: "+1 (555) 010-1815"
location: "London, UK"
website: "https://ada.example.com"
github: "adalovelace"
linkedin: "adalovelace"
summary: >
  Systems engineer with 15+ years building distributed infrastructure,
  developer tooling, and high-throughput data pipelines. Comfortable from
  kernel-adjacent work up to product-facing APIs. Strong preference for
  boring technology, sharp interfaces, and code that survives its author.
---

> **You're looking at a demo resume rendered by [starsheet](https://github.com/nulvox/starsheet)** —
> a GitHub template for single-source Markdown resumes that export to HTML,
> PDF, DOCX, and RTF. The person below is fictional. To build your own,
> click **"Use this template"** on the [template repo](https://github.com/nulvox/starsheet)
> and edit `src/content/resume.md`.

## Summary

Systems engineer with 15+ years building distributed infrastructure,
developer tooling, and high-throughput data pipelines. Comfortable from
kernel-adjacent work up to product-facing APIs. Strong preference for boring
technology, sharp interfaces, and code that survives its author.

## Experience

### Principal Engineer — **Analytical Engine Co.** {.role}
*Jan 2021 – Present · London, UK*

- Led the rewrite of the core scheduling layer from a hand-rolled actor
  system to a Rust-based work-stealing executor; reduced p99 task latency
  from 340ms to 28ms across 12k workers.
- Designed and shipped an internal Wasm plugin runtime that lets product
  teams deploy customer-specific transforms without redeploying the
  pipeline. Adopted by 8 of 11 product teams in the first six months.
- Mentored four senior engineers into staff-level scope; built the
  engineering ladder rubric the company still uses.

### Staff Engineer — **Babbage Systems** {.role}
*Mar 2016 – Dec 2020 · Remote*

- Owned the storage layer for a multi-tenant timeseries database (Go,
  500TB+ active, 2M writes/sec sustained). Reduced steady-state cost per
  ingested point by 61% over three years.
- Built `babctl`, the operational CLI used by every SRE in the company.
  Open-sourced internally; eventually externalised as the basis for the
  Babbage Cloud control plane.
- Drove adoption of property-based testing across the storage org. Caught
  a class of off-by-one bugs in compaction that had previously shipped
  three times.

### Senior Engineer — **Punchcard Labs** {.role}
*Jul 2012 – Feb 2016 · Cambridge, UK*

- First infrastructure hire. Built the deploy system, the secrets pipeline,
  and the initial observability stack from a blank repo.
- Wrote the company's first incident review process. Still in use, mostly
  unchanged, eight years later.

## Open Source

- **`weaver`** — a Rust crate for building deterministic distributed test
  harnesses. 4.2k stars. Used in production by three companies I know of
  and probably more I don't.
- **`pgsnap`** — a Postgres logical-snapshot tool written in Go. Featured
  in *Postgres Weekly* #487.
- Occasional contributor to the **Pandoc**, **Nushell**, and **helix**
  projects.

## Skills

**Languages**: Rust, Go, Python, C, TypeScript, a bit of OCaml when no one
is watching.
**Systems**: Linux internals, eBPF, io_uring, distributed consensus
(Raft/Paxos in anger), Postgres, ClickHouse, Kafka, NATS.
**Practice**: Property-based testing, fuzzing, formal modelling with TLA+
for the parts that warrant it, technical writing, mentoring.

## Education

**MSc, Computer Science** — University of Cambridge, 2012
**BA, Mathematics** — University of Cambridge, 2010

## Speaking & Writing

- *"Boring Storage for Exciting Problems"* — Strange Loop 2023
- *"What I Learned Deleting 40,000 Lines of Code"* — QCon London 2022
- Blog at <https://ada.example.com/writing> — roughly one post per month,
  mostly about distributed systems pathologies.
