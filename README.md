# ModernRBLX2016

A research and compatibility project centered on the classic Roblox iOS experience from the 2016 era, with the goal of preserving its original visual design while exploring modern, supported Roblox functionality.

## Project goals

- Preserve the classic 2016-style interface and user experience.
- Study the original application's structure and behavior.
- Separate legacy UI/resources from modern compatibility work.
- Build original project code around the research rather than redistributing Roblox's proprietary application.
- Keep the project organized for future iPad testing.

## Repository structure

```text
ModernRBLX2016/
├── analysis/       # Compatibility research and observed legacy behavior
├── docs/           # Architecture and project documentation
├── source/
│   ├── ui/         # 2016-style UI implementation
│   ├── resources/  # Project-owned UI resources and references
│   ├── analysis/   # Source-level research notes
│   └── compatibility/
│       ├── index.js    # Supported upstream service adapters
│       ├── client.js   # Client-facing compatibility API
│       ├── server.js   # Project-owned HTTP compatibility service
│       ├── test.js     # Unit checks
│       └── README.md
├── tools/          # Utilities used during development and analysis
├── package.json
├── .gitignore
└── README.md
```

## Compatibility service

The project now contains a small Node.js compatibility service that keeps the 2016-style UI separate from modern service details.

```bash
npm install
npm test
npm start
```

The service listens on `http://localhost:3000` by default and exposes project-owned routes for user lookup, game lookup, public server discovery, thumbnails, asset details, and configuration.

## Original IPA

The original Roblox IPA should remain outside this public repository. Keep a local copy for research and analysis instead of committing the IPA or proprietary Roblox binaries/assets.

## Status

🚧 Early development — compatibility service foundation is implemented; legacy-client mapping and UI integration remain under active research.

## Scope

This project is intended for research, UI recreation, and compatibility work. It does not aim to bypass Roblox authentication, integrity checks, or other platform security mechanisms.
