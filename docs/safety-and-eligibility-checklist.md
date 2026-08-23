# Safety & Eligibility Checklist

ModernRBLX2016 should preserve Roblox account safety restrictions rather than replace or weaken them.

## Account eligibility

- [ ] Use a supported Roblox account/eligibility signal before enabling restricted features.
- [ ] If the supported integration says the account is not eligible for the application's required access level, keep the user outside the restricted experience and return to the eligibility/sign-in screen.
- [ ] Do not infer age from appearance, profile text, or other unreliable signals.
- [ ] Do not collect, store, or process government ID images or facial-age media in ModernRBLX2016.

## Age-based account tiers

Track compatibility with Roblox's current age-based account framework:

- Roblox Kids: verified age 5–8.
- Roblox Select: verified age 9–15.
- Roblox: verified age 16+.

Exact availability and requirements can vary by region and by Roblox rollout. The app must treat Roblox's supported account/service state as authoritative.

## Parental controls

- [ ] Respect Roblox parental restrictions.
- [ ] Respect approved-experience/content restrictions.
- [ ] Respect communication/chat restrictions.
- [ ] Respect spending and screen-time restrictions where supported signals are available.
- [ ] Never expose a restricted feature merely because the client is an older-style UI.

## Chat and communication

- [ ] Do not implement an alternate chat path that bypasses Roblox safety systems.
- [ ] When communication is supported, use Roblox-supported mechanisms and respect privacy, age, and parental settings.
- [ ] Do not store or transmit private account credentials in this project.

## Verification policy

The native app may enforce a project policy such as "eligible account required," but it must only act on an authoritative, supported verification/eligibility result. ModernRBLX2016 must never attempt to perform or circumvent Roblox age verification itself.

## Status

Research/integration required. Some account and parental-control state is only exposed in specific Roblox contexts or supported APIs, so no client-side check should be described as authoritative until verified.
