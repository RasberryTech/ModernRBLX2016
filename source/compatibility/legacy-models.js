/**
 * Normalize supported Roblox responses into small, UI-friendly models.
 * The UI should depend on these shapes rather than upstream response schemas.
 */

function first(value) {
  return Array.isArray(value) ? value[0] || null : value || null;
}

function normalizeUser(response) {
  const user = response || {};
  return {
    id: user.id ?? null,
    username: user.name ?? null,
    displayName: user.displayName ?? user.name ?? null,
    description: user.description ?? "",
    created: user.created ?? null,
    isBanned: Boolean(user.isBanned)
  };
}

function normalizeGame(response) {
  const game = first(response?.data) || {};
  return {
    universeId: game.id ?? null,
    name: game.name ?? "",
    description: game.description ?? "",
    creator: game.creator || null,
    rootPlaceId: game.rootPlaceId ?? null,
    playing: game.playing ?? 0,
    visits: game.visits ?? 0,
    maxPlayers: game.maxPlayers ?? 0
  };
}

function normalizeServers(response) {
  const items = Array.isArray(response?.data) ? response.data : [];
  return items.map((server) => ({
    id: server.id ?? null,
    playing: server.playing ?? 0,
    maxPlayers: server.maxPlayers ?? 0,
    fps: server.fps ?? null,
    ping: server.ping ?? null
  }));
}

function normalizeThumbnail(response) {
  const item = first(response?.data) || {};
  return {
    targetId: item.targetId ?? null,
    state: item.state ?? null,
    imageUrl: item.imageUrl ?? null,
    version: item.version ?? null
  };
}

function normalizeAsset(response) {
  const asset = response || {};
  return {
    id: asset.AssetId ?? asset.assetId ?? null,
    name: asset.Name ?? asset.name ?? "",
    description: asset.Description ?? asset.description ?? "",
    creator: asset.Creator || null,
    assetTypeId: asset.AssetTypeId ?? asset.assetTypeId ?? null,
    created: asset.Created ?? asset.created ?? null,
    updated: asset.Updated ?? asset.updated ?? null
  };
}

module.exports = {
  normalizeUser,
  normalizeGame,
  normalizeServers,
  normalizeThumbnail,
  normalizeAsset
};
