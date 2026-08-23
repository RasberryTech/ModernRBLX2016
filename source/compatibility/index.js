const BASES = Object.freeze({
  users: "https://users.roblox.com",
  games: "https://games.roblox.com",
  thumbnails: "https://thumbnails.roblox.com",
  economy: "https://economy.roblox.com",
  catalog: "https://catalog.roblox.com"
});

async function request(url, options = {}) {
  const response = await fetch(url, {
    ...options,
    headers: { Accept: "application/json", ...(options.headers || {}) }
  });

  const text = await response.text();
  let body;
  try { body = text ? JSON.parse(text) : null; } catch { body = text; }

  if (!response.ok) {
    const error = new Error(`Roblox service returned HTTP ${response.status}`);
    error.status = response.status;
    error.body = body;
    throw error;
  }
  return body;
}

async function getUser(userId) {
  return request(`${BASES.users}/v1/users/${encodeURIComponent(userId)}`);
}

async function getGame(universeId) {
  return request(`${BASES.games}/v1/games?universeIds=${encodeURIComponent(universeId)}`);
}

async function getPublicServers(placeId, limit = 100) {
  const safeLimit = Math.min(Math.max(Number(limit) || 10, 10), 100);
  return request(`${BASES.games}/v1/games/${encodeURIComponent(placeId)}/servers/Public?limit=${safeLimit}`);
}

async function getAvatarThumbnail(userId, size = "150x150", format = "Png") {
  return request(`${BASES.thumbnails}/v1/users/avatar-headshot?userIds=${encodeURIComponent(userId)}&size=${encodeURIComponent(size)}&format=${encodeURIComponent(format)}&isCircular=false`);
}

async function getGameThumbnail(universeId, size = "512x512", format = "Png") {
  return request(`${BASES.thumbnails}/v1/games/icons?universeIds=${encodeURIComponent(universeId)}&size=${encodeURIComponent(size)}&format=${encodeURIComponent(format)}&isCircular=false`);
}

async function getAssetDetails(assetId) {
  return request(`${BASES.economy}/v2/assets/${encodeURIComponent(assetId)}/details`);
}

async function searchAvatarItems({ keyword = "", category = "", salesTypeFilter = "1", limit = 30, cursor = "" } = {}) {
  const params = new URLSearchParams();
  params.set("keyword", keyword);
  params.set("salesTypeFilter", String(salesTypeFilter));
  params.set("limit", String(Math.min(Math.max(Number(limit) || 10, 10), 120)));
  if (category) params.set("category", category);
  if (cursor) params.set("cursor", cursor);
  return request(`${BASES.catalog}/v1/search/items/details?${params.toString()}`);
}

module.exports = {
  BASES,
  getUser,
  getGame,
  getPublicServers,
  getAvatarThumbnail,
  getGameThumbnail,
  getAssetDetails,
  searchAvatarItems
};
