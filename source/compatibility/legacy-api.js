const { createCompatibilityClient } = require('./client');
const { createMockApi } = require('./mock-api');
const {
  normalizeUser,
  normalizeGame,
  normalizeServers,
  normalizeThumbnail,
  normalizeAsset
} = require('./legacy-models');

/**
 * Semantic 2016-style service facade.
 * `mock: true` keeps UI development offline and deterministic.
 */
function createLegacyApi(options = {}) {
  const client = options.api || (options.mock
    ? createMockApi()
    : createCompatibilityClient(options.baseUrl));

  return Object.freeze({
    getCurrentUser: async (userId) => normalizeUser(await client.user(userId)),
    getGameDetails: async (universeId) => normalizeGame(await client.game(universeId)),
    getServers: async (placeId, limit) => normalizeServers(await client.publicServers(placeId, limit)),
    getAvatar: async (userId) => normalizeThumbnail(await client.avatarThumbnail(userId)),
    getGameIcon: async (universeId) => normalizeThumbnail(await client.gameThumbnail(universeId)),
    getAsset: async (assetId) => normalizeAsset(await client.asset(assetId)),
    getConfiguration: () => client.config()
  });
}

module.exports = { createLegacyApi };
