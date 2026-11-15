# M0 Legacy Stabilization Baseline

Historical 2026-10-25 snapshot. Use the
[current Shakel M0 evidence](../product/M0_CURRENT_STATE.md) for the active
toolchain, rename, build, and CI status.

Last verified: 2026-10-25
Branch: `feat/design-project-domain`

## Commands

| Check | Result | Notes |
|---|---|---|
| `flutter pub get` | Passed | Dependency graph resolves with the current Flutter SDK |
| `dart format --output=none --set-exit-if-changed` | Passed | Checked the stabilized widget and its test |
| `flutter analyze` | Passed | No issues found |
| `flutter test --coverage` | Passed | 1 widget test passed |

## Fixes included in this stabilization pass

- Raised the direct `intl` constraint from `0.20.2` to `0.20.3` so it is
  compatible with the Flutter SDK's `flutter_localizations` constraint.
- Replaced the deprecated `DropdownButtonFormField.value` parameter with
  `initialValue` in `CustomDropdown`.

## Remaining baseline limits

- The repository still has only one meaningful automated widget test.
- A device/emulator smoke run is still required for navigation, image
  permissions, and native asset restoration.
- `RoomPlan` and `RoomDesignProject` remain parallel concepts until the
  ownership decision is implemented and tested.
- The CI workflow is present, but its remote run must be observed after the
  stabilization commit is pushed.
