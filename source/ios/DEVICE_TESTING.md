# ModernRBLX2016 device testing

The Xcode target is configured for automatic Development signing.

## Devices

- Main tablet target: iPad mini 6
- Phone target: iPhone 11
- Device families: iPhone + iPad

## Xcode setup

1. Open `ModernRBLX2016.xcodeproj` in Xcode on a Mac.
2. Select the `ModernRBLX2016` target.
3. Open **Signing & Capabilities**.
4. Select your Apple Developer **Team**. Do not commit the team identifier to this repository.
5. Keep **Automatically manage signing** enabled.
6. Connect the iPhone 11 or iPad mini 6 and select it as the run destination.
7. Run the shared `ModernRBLX2016` scheme.

The project is configured to use an Apple Development signing identity and a project-owned bundle identifier. Your team/device provisioning is intentionally left to Xcode.

## Important

This is development signing only. No distribution certificate, provisioning profile, private key, or Apple account secret belongs in GitHub.
