# Compatibility Service

This directory contains the project-owned compatibility service. It provides a stable, small interface for the 2016-style UI and calls supported Roblox public web services behind that interface.

## Run

```bash
node source/compatibility/server.js
```

or:

```bash
npm start
```

The default listener is `http://localhost:3000`.

## Endpoints

- `GET /api/config`
- `GET /api/users/:userId`
- `GET /api/games/:universeId`
- `GET /api/games/:placeId/servers`
- `GET /api/thumbnails/users/:userId`
- `GET /api/thumbnails/games/:universeId`
- `GET /api/assets/:assetId`

`/api/auth` intentionally returns `501` until a supported authentication integration is designed. The service does not replay legacy credentials, bypass authentication, or disable integrity/security controls.

## Client integration

The 2016-style UI should call these project-owned routes rather than embedding modern Roblox service URLs throughout the UI. That keeps the UI stable if a supported upstream API changes.
