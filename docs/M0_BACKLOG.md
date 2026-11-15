# M0 execution backlog — Shakel

Status observed 2026-11-15. The [Shakel master plan](product/README.md) defines
scope; [current evidence](product/M0_CURRENT_STATE.md) records checks and limits.
M0 is OPEN until every exit gate below has evidence.

| ID | Work | Current evidence | Exit evidence still needed |
| --- | --- | --- | --- |
| RG-001 | Complete repository inventory | Android, assets, lockfile, CI, and tests are tracked in the full Git repo | Decide whether an iOS target is required for the first release; restore it if required |
| RG-002 | Reproducible toolchain and Android build | Flutter 3.32.8 selected by `.fvmrc`; locked pub resolution, format, analyze, 2 tests, and development debug APK pass | Android licenses and device smoke |
| RG-003 | Single create-room Cubit | Router-owned Cubit and widget identity test pass locally | Review isolated diff, manual wizard open/close, passing PR CI |
| RG-004 | RoomProject vocabulary and migration boundary | Target domain principles exist in the plan and proposed ADRs | Review mapping from legacy `RoomPlan` and `RoomDesignProject`, stable IDs, minor currency units, unknown dimensions |
| RG-005 | Product brief and acceptance cases | Shakel v3 plan and draft PRDs exist | Review one canonical scope and acceptance map; record unresolved user research assumptions |
| RG-006 | Architecture decisions | Existing ADRs are proposed | Review toolchain, local data recovery, identity/owner/quotas before AI, and implementation boundaries |
| RG-007 | CI | GitHub Actions has locked pub, format, analyze, test, Android build, and artifact upload | Observe a green pull request run |
| RG-008 | Technical Shakel rename | Dart package, display names, Android IDs, Kotlin package, web metadata, and development APK identity are verified | On-device verification and existing-install upgrade/data policy |

## Closure rule

Do not mark M0 complete from a document or passing unit tests alone. Record the
exact SDK, commands, CI run, APK artifact, device result, reviewed PRD/ADRs,
and remaining product decisions. Preserve the existing dirty work and split
reviewable changes before merging. Do not claim the M2 save flow is complete:
its button still exits without calling the new save method.
