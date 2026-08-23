const { createCompatibilityClient } = require('./client');

/**
 * Thin 2016-style service facade for the recreated UI.
 * Keep UI code dependent on these semantic operations instead of URLs.
 */
function createLegacyApi(options = {}) {
  const client = createCompatibilityClient(options.baseUrl);

  return Object.freeze({
    getCurrentUser: (userId) => client.user(userId),
    getGameDetails: (universeId) => client.game(universeId),
    getServers: (placeId, limit) => client.publicServers(placeId, limit),
    getAvatar: (userId) => client.avatarThumbnail(userId),
    getGameIcon: (universeId) => client.gameThumbnail(universeId),
    getAsset: (assetId) => client.asset(assetId),
    getConfiguration: () => client.config()
  });
}

module.exports = { createLegacyApi };
