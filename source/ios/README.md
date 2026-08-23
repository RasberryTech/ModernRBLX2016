# ModernRBLX2016 iOS/iPadOS UI

This directory contains original SwiftUI implementation for the ModernRBLX2016 client UI.

## Targets

- iPhone
- iPad, including iPad mini and iPad Pro
- Adaptive portrait and landscape layouts
- iOS/iPadOS 26+ as the current development target
- Designed to remain compatible with future iOS/iPadOS releases

## Design

The UI uses project-owned SwiftUI components to recreate the compact visual language of the 2016-era Roblox iOS experience without including proprietary Roblox application code or assets.

## Compatibility integration

The native UI should communicate with the project-owned compatibility service rather than embedding upstream service URLs. See `source/compatibility/`.

## Current screens

- Home
- Games placeholder
- Avatar placeholder
- Profile placeholder

The latter screens are intentionally small scaffolds ready to be connected to the compatibility models.
