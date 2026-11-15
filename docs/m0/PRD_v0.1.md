# RoomGenius 2.0 - PRD v0.1

Historical draft. The [Shakel v3 plan](../product/README.md) is the current
product reference; reconcile this draft before using it for M0 acceptance.

Status: Draft for M0
Last updated: 2026-10-25

## Product decision

RoomGenius is evolving from a prompt-building app into a local-first room
project product. The primary user journey starts with a real room and ends
with a design choice, a shopping plan, and execution tracking. Prompt
generation remains a supporting capability inside the design journey.

## Primary user

A person in Egypt who is furnishing or renovating a room, has a real room
photo, a limited budget, and some furniture they may want to keep.

## V1 journey

1. Create a room project.
2. Define the design brief: room type, style, mood, colors, constraints, and budget.
3. Generate and save one or more AI design variants.
4. Compare variants and select a preferred design.
5. Build a shopping plan with user-entered prices and sources.
6. Track purchases, budget, and execution tasks.

## M0 scope

M0 establishes a buildable baseline before new product features are added:

- restore and verify the repository, assets, and platform configuration;
- document the product scope, screen map, and explicit non-goals;
- define `RoomProject` as the target product aggregate;
- identify and isolate legacy `RoomPlan` behavior;
- record architecture decisions and current gaps;
- establish repeatable formatting, analysis, test, and CI checks.

## MVP non-goals

The first release will not include 3D/AR placement, reliable measurements from
a single photo, marketplace checkout, automatic store pricing without an
authorized data source, multi-device sync, or a claim that generated images
are engineering-accurate room plans.

## Acceptance scenarios

- The app opens without a navigation crash and reaches the existing home flow.
- The repository can install dependencies using the documented Flutter version.
- Formatting, static analysis, and tests are represented by CI checks.
- A reviewer can identify the target product journey and what is deliberately
  out of scope.
- Every architectural decision that affects M1+ has a written ADR.

## Evidence policy

We only claim work that is present in the repository and backed by a passing
command, test result, screenshot, demo, or measured report.
