# M0 Gap List

This is a working inventory, not a claim that every item is already fixed.

| ID | Gap | Evidence / current state | Planned milestone |
|---|---|---|---|
| GAP-001 | Two project concepts exist | `RoomPlan` is used by the current room-plans flow while `RoomDesignProject` exists in design-studio domain | M0-M1 |
| GAP-002 | Project persistence is not yet the target database model | Current room-plan storage serializes a list through local storage | M1 |
| GAP-003 | Create-room ownership is split | `CreateRoomCubit` currently coordinates image selection and prompt preview; persistence ownership needs a single project boundary | M0-M2 |
| GAP-004 | Real image generation is absent | Current flow builds prompt content; no persisted generation job/result workflow is present | M3 |
| GAP-005 | CI baseline needs local evidence | Workflow exists, but local analyzer execution is currently blocked by a Windows process permission issue | M0 |
| GAP-006 | Product documentation is behind the target direction | Existing README describes the prompt-first product | M0 |
| GAP-007 | User research evidence is missing | No captured interviews or structured feedback set is tracked yet | M0 |

## Handling rules

- Do not delete legacy storage before backup, migration verification, and a
  rollback path exist.
- Do not rename a legacy concept merely to make the architecture look unified.
- Close a gap with code plus tests or reproducible evidence where applicable.
- Update this file at the end of every milestone.
