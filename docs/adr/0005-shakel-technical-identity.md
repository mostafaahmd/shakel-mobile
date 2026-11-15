# ADR-0005: Shakel technical identity in M0

- Status: Accepted for the local technical rename; external configuration and
  release policy remain open
- Date: 2026-11-15

## Context

The user made the technical app rename an M0 exit requirement. The prior Dart
package and Android application IDs used RoomGenius. Firebase integration is
explicitly deferred beyond M0.

## Decision

- Rename the Dart package to `shakel_mobile` and update package imports.
- Use Shakel / شَكْل for the displayed app name.
- Use `com.shakel.mobile.dev` for Android development and
  `com.shakel.mobile` for Android production, with `com.shakel.mobile` as the
  Android namespace and Kotlin package.
- Keep the Git repository URL unchanged until repository hosting is renamed
  explicitly. A repository URL is not the application ID.
- Remove inactive Firebase dependencies, Android plugins, and generated client
  configuration from the M0 build. Add Firebase later through a reviewed ADR
  and environment-specific setup when a feature requires it.

## Consequences and open decisions

- Android treats a changed application ID as a separate app. Existing local
  RoomGenius data will not automatically appear in Shakel; decide migration,
  export/import, or a clean-start policy before public rollout.
- The public brand and domain still require clearance before store release.
- An iOS target is absent in this checkout. Choose the target bundle ID and
  configure iOS if iOS is included in the first release.

## Verification

`flutter pub get --enforce-lockfile`, format, analyze, and tests with the pinned
SDK; then build both Android flavors, inspect final application IDs and labels,
and run a device smoke test. Record PR CI and APK evidence before closing M0.
