# Authentication and Age/Safety Compatibility

Document how the legacy client initiates authentication and what a supported modern integration can provide.

## Requirements

- Identify the legacy client flow from research.
- Document request/response shapes without storing credentials or tokens.
- Map each requirement to a supported modern Roblox mechanism when one exists.
- Record unsupported legacy behavior instead of attempting to bypass security.

## Roblox age-based account compatibility

Current Roblox accounts use age-based experiences. Roblox Kids is for ages 5-8, Roblox Select is for ages 9-15, and standard Roblox is for age-checked users 16+. Roblox says age checks can use government-ID verification or Facial Age Estimation, and users who have not completed an age check cannot use chat. citeturn618946search0turn618946search2

### Compatibility checklist

- [ ] Detect/consume the account's supported age/account state through an approved Roblox interface.
- [ ] Respect Roblox Kids restrictions and catalog rules.
- [ ] Respect Roblox Select restrictions and catalog rules.
- [ ] Respect standard Roblox 16+ access rules.
- [ ] Respect content maturity ratings and experience eligibility.
- [ ] Respect parental controls and blocked experiences.
- [ ] Respect chat availability based on Roblox's current age-check rules.
- [ ] Never implement or suggest bypassing Roblox age checks, account restrictions, parental controls, or content gates.
- [ ] Do not store identity documents, facial-age data, or sensitive verification material in this repository.

## Status

Age/account compatibility: research and supported-integration work needed.
