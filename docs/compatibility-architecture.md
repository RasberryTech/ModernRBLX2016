# ModernRBLX2016 Compatibility Architecture

## Goal

Preserve the 2016-style Roblox experience while using modern, supported functionality where possible.

```text
2016-style UI
     |
     v
ModernRBLX2016 client code
     |
     v
Compatibility adapters
     |
     +--> authentication adapter
     +--> user/profile adapter
     +--> game discovery adapter
     +--> asset adapter
     +--> thumbnail adapter
     +--> configuration adapter
     +--> networking adapter
     |
     v
Supported Roblox interfaces
```

## Design principles

1. Keep legacy UI separate from service adapters.
2. Keep endpoint observations in `analysis/`.
3. Use documented/supported Roblox functionality where available.
4. Fail clearly when a legacy feature has no supported equivalent.
5. Never store credentials, tokens, cookies, or private account data in the repository.
6. Do not bypass authentication, integrity checks, or other platform security mechanisms.
7. Do not redistribute proprietary Roblox binaries or assets.

## Adapter contract

Each adapter should expose a small project-owned interface so the UI does not depend directly on service-specific HTTP details.

```text
UI -> Client Service Interface -> Adapter -> Supported Service
```

## Testing

Use mock responses and project-owned fixtures for deterministic development. Integration tests should use supported interfaces and test accounts/environments where permitted.
