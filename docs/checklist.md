# ModernRBLX2016 Master Checklist

## 2016 experience
- [x] 2016-style Home UI architecture
- [x] 2016 game UI architecture
- [x] 2016 HUD panels: player list, chat, backpack, menu, health, touch controls
- [x] 2016 asset root established at `content/`
- [x] UI resource loader for `content/textures/ui`
- [x] Unified content asset loader
- [x] 2016 world-material catalog
- [x] No automatic replacement with modern/2022 material resources

## Live 2026 Roblox data
- [x] User lookup adapter
- [x] Game/universe lookup adapter
- [x] Public server discovery adapter
- [x] Avatar thumbnail adapter
- [x] Game thumbnail adapter
- [x] Asset details adapter
- [x] Live Marketplace browsing adapter
- [x] Swift networking layer
- [x] Loading/error states
- [x] TTL response cache
- [x] Mock/live environment switching

## Avatar/economy
- [x] Live avatar-item browsing
- [x] Official purchase handoff boundary
- [x] No payment credentials collected by the project
- [x] OBC-style classic badge can represent modern Roblox Plus visually
- [x] Actual subscription entitlement remains the live Roblox entitlement

## Account safety
- [x] Age-verification eligibility requirement documented
- [x] Kids/Select/16+ policy handling documented
- [x] Parental-control restrictions documented
- [x] Experience/content restrictions respected
- [x] Chat/communication restrictions respected
- [x] Eligibility gate interface
- [x] No ID/facial-age data collection
- [x] No bypass of Roblox safety or account restrictions

## Quality
- [x] Compatibility documentation
- [x] Endpoint research documentation
- [x] Node compatibility tests
- [x] GitHub Actions test workflow
- [x] Non-app completion boundary documented

## Explicitly excluded from this milestone
- [ ] Xcode signing/provisioning
- [ ] App archive/export/package distribution
- [ ] App Store submission
- [ ] Physical-device installation
- [ ] Replacement Roblox game engine/runtime

These excluded items are intentionally not being completed in this milestone.
