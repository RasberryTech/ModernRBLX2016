const DEFAULT_BASE = "http://localhost:3000";

function createCompatibilityClient(baseUrl = DEFAULT_BASE) {
  const base = String(baseUrl).replace(/\/$/, "");

  async function getJson(path, options = {}) {
    const response = await fetch(`${base}${path}`, {
      ...options,
      headers: { Accept: "application/json", ...(options.headers || {}) }
    });

    const text = await response.text();
    let body = null;
    try {
      body = text ? JSON.parse(text) : null;
    } catch {
      body = text;
    }

    if (!response.ok) {
      const error = new Error(`Compatibility service returned HTTP ${response.status}`);
      error.status = response.status;
      error.body = body;
      throw error;
    }

    return body;
  }

  return Object.freeze({
    config: () => getJson("/api/config"),
    user: (userId) => getJson(`/api/users/${encodeURIComponent(userId)}`),
    game: (universeId) => getJson(`/api/games/${encodeURIComponent(universeId)}`),
    publicServers: (placeId, limit) => {
      const query = limit == null ? "" : `?limit=${encodeURIComponent(limit)}`;
      return getJson(`/api/games/${encodeURIComponent(placeId)}/servers${query}`);
    },
    avatarThumbnail: (userId) =>
      getJson(`/api/thumbnails/users/${encodeURIComponent(userId)}`),
    gameThumbnail: (universeId) =>
      getJson(`/api/thumbnails/games/${encodeURIComponent(universeId)}`),
    asset: (assetId) => getJson(`/api/assets/${encodeURIComponent(assetId)}`)
  });
}

module.exports = { createCompatibilityClient };
