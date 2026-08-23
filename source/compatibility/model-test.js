const assert = require("node:assert/strict");
const { createLegacyApi } = require("./legacy-api");

(async () => {
  const api = createLegacyApi({ mock: true });

  const user = await api.getCurrentUser(1);
  assert.equal(user.id, 1);
  assert.equal(user.displayName, "ModernRBLX2016");

  const game = await api.getGameDetails(123456);
  assert.equal(game.universeId, 123456);
  assert.equal(game.name, "ModernRBLX2016 Test Place");

  const servers = await api.getServers(123457);
  assert.equal(servers.length, 2);
  assert.equal(servers[0].maxPlayers, 20);

  const avatar = await api.getAvatar(1);
  assert.equal(avatar.targetId, 1);
  assert.equal(avatar.state, "Completed");

  const icon = await api.getGameIcon(123456);
  assert.equal(icon.targetId, 123456);

  const asset = await api.getAsset(42);
  assert.equal(asset.id, 42);
  assert.equal(asset.name, "Mock Asset");

  const config = await api.getConfiguration();
  assert.equal(config.mode, "mock");

  console.log("ModernRBLX2016 normalized model checks passed.");
})().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
