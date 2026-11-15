# M0 current state and execution order

Observed on 2026-11-15 in the full Git repository. This is evidence from the
local working tree, not a claim that M0 is complete or that CI is green.

## Git and repository inventory

- Current branch: `feat/design-project-domain` at `14796e2`. It is two commits
  ahead of `main` (`a60d0ee`). A read-only `git ls-remote` check confirmed
  `origin/main` was also `a60d0ee` on 2026-11-15.
- The working tree already had uncommitted create-room, room-plan, domain,
  test, and draft documentation work before this audit. Preserve it. Do not
  rebase, merge, or switch branches with that work unresolved.
- Android, assets, `pubspec.lock`, `.github/workflows/flutter_ci.yml`, and tests
  are tracked. An `ios/` directory is absent in this checkout. Statements in
  draft audits based on `room.zip` do not describe this complete repository.
- The Flutter CI workflow pins 3.32.8. `.fvmrc` now selects the same version
  (Dart 3.8.1). The default PATH still points at Flutter 3.47.5; use FVM or
  the 3.32.8 SDK explicitly. `intl` was adjusted from 0.20.3 to the 0.20.2
  version pinned by Flutter 3.32.8. `pubspec.lock` changed only for `intl`.

## Local checks

| Check | Result | Limit |
| --- | --- | --- |
| `flutter pub get --enforce-lockfile --offline` | Passed | Flutter 3.32.8 with the updated `intl` lock entry |
| `flutter analyze --no-pub` | Passed | Flutter 3.32.8, current dirty tree |
| `flutter test --no-pub` | Passed, 2 tests | Flutter 3.32.8, current dirty tree |
| `dart format --output=none --set-exit-if-changed .` | Passed, 132 files and 0 changes | Dart 3.8.1 from Flutter 3.32.8 |
| `flutter doctor -v` | Android SDK present; Android licenses incomplete; no Android device attached | Flutter 3.32.8 |
| `flutter build apk --debug --flavor development -t lib/app/flavors/main_dev.dart --no-pub` | Passed after disabling Kotlin incremental caches for the cross-drive Windows setup | 251,335,704-byte APK; SHA-256 `58CB4733DCF54715EFB4130B31A6CA4124C51F29CF8B82F6E58F3F9C30C9F9AE` |
| APK identity inspection | Passed | Package `com.shakel.mobile.dev`, label `Shakel Dev`, launch activity `com.shakel.mobile.MainActivity` |

No device navigation smoke test or observed remote CI run is recorded here.
Three local AVDs exist, but the emulator launch permission was declined during
this audit. The pull request CI now performs the same development APK build.
An earlier attempt with the default Flutter 3.47.5 failed before compilation
because Gradle 8.12.0 was below that SDK's minimum 8.14.0. The tool-generated
Gradle and dependency changes from that attempt were reverted.

## M0 technical rename in progress

The user explicitly made the technical Shakel rename an M0 exit requirement.
The local changes now use `shakel_mobile`, display name Shakel / شَكْل,
`com.shakel.mobile` for production, and `com.shakel.mobile.dev` for development.
Firebase is deferred by product decision. Inactive Firebase packages, Android
plugins, generated options, and old RoomGenius client configuration are
removed from the M0 build. A development Firebase app was created externally
during the audit but is not connected to this repository. Reintroducing
Firebase requires a later reviewed integration change.

## Review the existing working tree before a PR

1. **Cubit ownership (M0, RG-003):** the router creates `CreateRoomCubit` and
   the wizard now reads that instance. The widget regression test checks the
   identity. Keep this as a small reviewed change once the dependency on the
   save-flow constructor is isolated or intentionally included.
2. **Save-flow draft (M2):** `saveProject()` has been added to the Cubit, but
   the wizard's final button still calls `Navigator.pop()` and never invokes
   it. The current UI must not be described as persisting a project.
3. **Save-flow data questions (M1/M2):** budget uses `double` rather than minor
   currency units; clearing invalid budget text retains the prior amount via
   `copyWith`; missing dimensions are stored as zero. Decide the model and
   test these cases before merging this flow.
4. **Legacy storage (M1):** malformed room-plan JSON currently removes the
   original key. Add recovery tests and preserve original bytes before a
   migration or write-path change.
5. **Draft product files:** reconcile the older RoomGenius documents and
   `room.zip`-based audit with the Shakel v3 plan and this inventory. Avoid
   two active PRDs or contradictory milestone status claims.

## Proposed small PR sequence

1. **M0 baseline and identity:** use the CI Flutter version, pin it for local
   development, complete the Shakel package/display/Android rename, then
   capture `doctor`, dependency resolution, format,
   analyze, test, Android builds for both flavors, and the remote PR CI result.
   Record exact commands and failures.
2. **M0 wizard regression:** Cubit ownership is isolated and its widget test
   verifies the same instance reaches the first step. Complete the manual
   open/close smoke check on an Android device or emulator.
3. **M0 product and architecture:** review the v3 plan, one PRD, target domain
   vocabulary, open decisions, and current gap list. Public brand clearance
   and store publication remain separate from the M0 technical rename.
4. **M1 project persistence:** after M0 gates, design mapping and recovery,
   prototype the database choice, then migrate with backups and tests.

For each PR: one problem, acceptance criteria, focused diff, tests and manual
evidence, risks, and rollback. Merge through a reviewed PR into `main`; do not
work directly on `main`. Create the next task branch from an up-to-date `main`
only after the current uncommitted work is preserved and classified.
