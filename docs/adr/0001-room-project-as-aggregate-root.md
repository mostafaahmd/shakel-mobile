# ADR-0001: RoomProject is the product aggregate root

- Status: Accepted for M0
- Date: 2026-10-25

## Context

The current codebase contains a `RoomPlan` flow and a newer
`RoomDesignProject` domain concept. The product roadmap needs one durable
project identity that can own the room asset, design brief, generated designs,
shopping plan, budget, and execution tasks.

## Decision

`RoomProject` is the target aggregate root for the product domain. Features may
expose use cases around it, but they must not create competing top-level
project identities. `RoomPlan` is treated as a legacy compatibility boundary
until M1 defines and verifies migration.

## Consequences

- New product contracts should reference `RoomProject`.
- Legacy data remains readable until a verified migration exists.
- M1 must define the entity relationships, IDs, schema version, and repository
  contract.
- The aggregate must not become a God Object; feature-specific behavior stays
  in use cases and domain services.
