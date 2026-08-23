const http = require("node:http");
const {
  getUser,
  getGame,
  getPublicServers,
  getAvatarThumbnail,
  getGameThumbnail,
  getAssetDetails
} = require("./index");

const PORT = Number(process.env.PORT || 3000);

function send(res, status, body) {
  const payload = JSON.stringify(body);
  res.writeHead(status, {
    "Content-Type": "application/json; charset=utf-8",
    "Access-Control-Allow-Origin": "*",
    "Cache-Control": "no-store"
  });
  res.end(payload);
}

function idFrom(path, prefix) {
  const value = path.slice(prefix.length).split("/")[0];
  return value && /^\d+$/.test(value) ? value : null;
}

async function route(req, res) {
  if (req.method === "OPTIONS") {
    res.writeHead(204, {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET,OPTIONS",
      "Access-Control-Allow-Headers": "Content-Type"
    });
    return res.end();
  }

  if (req.method !== "GET") return send(res, 405, { error: "GET only" });

  const url = new URL(req.url, `http://${req.headers.host || "localhost"}`);
  const path = url.pathname;

  try {
    if (path === "/api/config") {
      return send(res, 200, {
        version: 1,
        clientStyle: "2016",
        compatibility: {
          users: true,
          games: true,
          publicServers: true,
          avatarThumbnails: true,
          gameThumbnails: true,
          assetDetails: true,
          authentication: false,
          websocket: false
        },
        note: "Authentication and persistent networking require supported Roblox integration and are intentionally not implemented as security bypasses."
      });
    }

    if (path.startsWith("/api/users/")) {
      const id = idFrom(path, "/api/users/");
      if (!id) return send(res, 400, { error: "Invalid user ID" });
      return send(res, 200, await getUser(id));
    }

    if (path.startsWith("/api/games/") && path.endsWith("/servers")) {
      const id = idFrom(path, "/api/games/");
      if (!id) return send(res, 400, { error: "Invalid place ID" });
      return send(res, 200, await getPublicServers(id, url.searchParams.get("limit")));
    }

    if (path.startsWith("/api/games/")) {
      const id = idFrom(path, "/api/games/");
      if (!id) return send(res, 400, { error: "Invalid universe ID" });
      return send(res, 200, await getGame(id));
    }

    if (path.startsWith("/api/thumbnails/users/")) {
      const id = idFrom(path, "/api/thumbnails/users/");
      if (!id) return send(res, 400, { error: "Invalid user ID" });
      return send(res, 200, await getAvatarThumbnail(id));
    }

    if (path.startsWith("/api/thumbnails/games/")) {
      const id = idFrom(path, "/api/thumbnails/games/");
      if (!id) return send(res, 400, { error: "Invalid universe ID" });
      return send(res, 200, await getGameThumbnail(id));
    }

    if (path.startsWith("/api/assets/")) {
      const id = idFrom(path, "/api/assets/");
      if (!id) return send(res, 400, { error: "Invalid asset ID" });
      return send(res, 200, await getAssetDetails(id));
    }

    if (path === "/api/auth") {
      return send(res, 501, {
        error: "Authentication adapter is not implemented",
        reason: "ModernRBLX2016 must use a supported Roblox authentication flow rather than replaying or bypassing the legacy client flow."
      });
    }

    return send(res, 404, { error: "Unknown compatibility endpoint" });
  } catch (error) {
    return send(res, error.status || 502, {
      error: error.message,
      upstream: error.body || null
    });
  }
}

http.createServer(route).listen(PORT, () => {
  console.log(`ModernRBLX2016 compatibility server listening on http://localhost:${PORT}`);
});
