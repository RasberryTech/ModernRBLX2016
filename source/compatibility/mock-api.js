const MOCK_USER = {
  id: 1,
  name: "ModernRBLX2016",
  displayName: "ModernRBLX2016",
  description: "Local development profile",
  created: "2016-01-01T00:00:00Z",
  isBanned: false
};

const MOCK_GAME = {
  data: [{
    id: 123456,
    name: "ModernRBLX2016 Test Place",
    description: "Local compatibility test experience",
    creator: { id: 1, name: "ModernRBLX2016" },
    rootPlaceId: 123457,
    playing: 4,
    visits: 1200,
    maxPlayers: 20
  }]
};

function createMockApi() {
  return Object.freeze({
    config: async () => ({
      version: 1,
      clientStyle: "2016",
      compatibility: { users: true, games: true, publicServers: true, thumbnails: true, assets: true },
      mode: "mock"
    }),
    user: async () => ({ ...MOCK_USER }),
    game: async () => structuredClone(MOCK_GAME),
    publicServers: async () => ({
      data: [
        { id: "mock-server-1", playing: 4, maxPlayers: 20, fps: 60, ping: 45 },
        { id: "mock-server-2", playing: 11, maxPlayers: 20, fps: 58, ping: 72 }
      ]
    }),
    avatarThumbnail: async (userId) => ({
      data: [{ targetId: Number(userId), state: "Completed", imageUrl: "https://tr.rbxcdn.com/0/150/150/Avatar/Png", version: "1" }]
    }),
    gameThumbnail: async (universeId) => ({
      data: [{ targetId: Number(universeId), state: "Completed", imageUrl: "https://tr.rbxcdn.com/0/512/512/Game/Png", version: "1" }]
    }),
    asset: async (assetId) => ({
      AssetId: Number(assetId),
      Name: "Mock Asset",
      Description: "Local test asset",
      AssetTypeId: 1
    })
  });
}

module.exports = { createMockApi };
