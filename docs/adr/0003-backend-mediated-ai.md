# ADR-0003: AI generation is backend-mediated

- Status: Accepted for M0
- Date: 2026-10-25

## Context

Image generation is asynchronous, has cost and quota concerns, and requires
provider secrets, retries, and persisted job state. A mobile-only provider
integration would make security and recovery harder to control.

## Decision

The Flutter app will call a backend generation contract. Provider API keys,
quota enforcement, retries, provider adapters, job persistence, and cost
instrumentation belong behind the backend boundary. Flutter owns user-facing
job state, recovery UX, and the project relationship.

## Consequences

- M3 must define versioned generation endpoints and job lifecycle states.
- Fake providers are required for deterministic tests.
- A successful result must remain recoverable after app restart.
- No provider key may be shipped in the mobile app.
