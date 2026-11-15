# Product plan reference

The authoritative product and engineering plan for the Shakel transition is
[Shakel Master Product & Engineering Plan, Arabic v3.0](Shakel_Master_Product_Engineering_Plan_AR_v3_2026.pdf)
(dated 2026-11-15). Keep this PDF as a versioned source document. If a later
approved plan supersedes it, add the new file and record the change explicitly.

[M0 current state and execution order](M0_CURRENT_STATE.md) records verified
local evidence and the next reviewable changes.

## Current repository status

- The Dart package, app display name, and Android application IDs are being
  renamed to Shakel as an M0 requirement. Brand, domain, store, and legal
  checks are still open before public release.
- The local `feat/design-project-domain` branch contains two commits beyond
  the locally recorded `main` and has uncommitted work. Preserve and review
  that work before branching, rebasing, or merging.
- The full Git repository includes Android, assets, a lockfile, CI, and tests.
  Earlier M0 notes based on an incomplete `room.zip` must be checked against
  this repository before their gap claims are treated as current.
- M0 is the active milestone. Its exit needs the verified technical rename,
  build, analyze, test, first regression coverage, reviewed product and
  architecture decisions, and a passing CI run. The PDF's milestone status is
  a plan, not build evidence.

## Delivery rule

Use a small task branch from a known baseline for each reviewed change. Record
the problem, acceptance criteria, tests, risk, and rollback in the pull request.
Do not combine preservation of the current working tree, product renaming,
domain migration, and AI integration in one change.
