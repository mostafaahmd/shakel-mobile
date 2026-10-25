# ADR-0002: Local-first project state for V1

- Status: Accepted for M0
- Date: 2026-10-25

## Context

The core user journey should survive leaving and reopening the app. The first
release does not require multi-device synchronization, while room photos and
project state need explicit ownership and safe recovery.

## Decision

V1 uses local-first project state. M1 will introduce a versioned database and
repository boundary, while image files are managed separately from structured
project records. Remote services are added behind explicit contracts for
authentication, generation jobs, and future synchronization.

## Consequences

- Every save and migration path must be restart-safe.
- Image references are stable asset IDs or managed relative references, not
  absolute paths embedded in business rules.
- Legacy storage is retained until migration verification and rollback are
  demonstrated.
- Multi-device sync is outside V1 and must not leak into current domain APIs.
