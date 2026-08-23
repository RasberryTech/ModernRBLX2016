# ModernRBLX2016 Non-App Completion

This milestone intentionally excludes turning the project into a distributable/installable app. Xcode signing, provisioning, archive/export, App Store packaging, and physical-device deployment remain separate.

## Completed architecture

- 2016-style UI source layer
- 2016 game HUD source layer
- Project `content/` treated as the 2016-era resource root
- UI asset loader for `content/textures/ui`
- Unified content asset loader
- 2016 world-material catalog with no modern/2022 material substitution
- Live Roblox user/game/server/thumbnail service adapters
- Live Marketplace browsing
- Official-purchase handoff boundary; no payment credential collection
- Mock/live service switching
- Loading/error state handling
- TTL response caching
- Age/eligibility and parental-policy gate interfaces

## 2016 resource policy

The renderer should resolve UI and world resources from `content/` first. Modern Roblox resources are used only for modern live-service data such as user, game, server, thumbnail, and marketplace metadata.

The repository does not implement a second modern material set that would silently replace the 2016 material presentation.

## Verification policy

A feature is marked verified only after a deterministic project-owned test or an explicit live integration test. A documented endpoint is not treated as verified merely because its URL exists.

## Remaining non-app limitation

The actual live Roblox game runtime is not part of this compatibility/UI layer. This milestone provides the 2016 visual/HUD layer and modern service plumbing, not a replacement Roblox engine.
