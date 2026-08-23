# Native iOS/iPadOS build

The repository now includes `ModernRBLX2016.xcodeproj` with one universal iPhone/iPad application target.

## Target

- Product: ModernRBLX2016
- Bundle identifier: `com.rasberrytech.modernrblx2016`
- Device families: iPhone and iPad
- Deployment target: iOS 15.0 or newer
- SDK: use the current iOS SDK installed with Xcode

## Physical-device build

1. Open `ModernRBLX2016.xcodeproj` in Xcode on a Mac.
2. Select the `ModernRBLX2016` scheme.
3. Select a connected iPhone or iPad as the run destination.
4. In Signing & Capabilities, select your Apple Developer team and let Xcode manage signing.
5. Build and run.

The repository can define the source and target configuration, but actual device signing and installation must be performed by Xcode with the developer's own Apple account/team.

## Current scope

The app shell is native SwiftUI and uses adaptive navigation for iPhone/iPad. The compatibility service remains a separate component; authentication is intentionally not implemented as a security bypass.
