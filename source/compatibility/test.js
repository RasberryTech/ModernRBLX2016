const assert = require("node:assert/strict");
const { BASES } = require("./index");
const { createCompatibilityClient } = require("./client");
const { createLegacyApi } = require("./legacy-api");

assert.equal(BASES.users, "https://users.roblox.com");
assert.equal(BASES.games, "https://games.roblox.com");
assert.equal(BASES.thumbnails, "https://thumbnails.roblox.com");
assert.equal(BASES.economy, "https://economy.roblox.com");

const client = createCompatibilityClient("http://localhost:3000/");
assert.equal(typeof client.config, "function");
assert.equal(typeof client.user, "function");
assert.equal(typeof client.game, "function");
assert.equal(typeof client.publicServers, "function");
assert.equal(typeof client.avatarThumbnail, "function");
assert.equal(typeof client.gameThumbnail, "function");
assert.equal(typeof client.asset, "function");

const legacyApi = createLegacyApi({ baseUrl: "http://localhost:3000/" });
assert.equal(typeof legacyApi.getCurrentUser, "function");
assert.equal(typeof legacyApi.getGameDetails, "function");
assert.equal(typeof legacyApi.getServers, "function");
assert.equal(typeof legacyApi.getAvatar, "function");
assert.equal(typeof legacyApi.getGameIcon, "function");
assert.equal(typeof legacyApi.getAsset, "function");
assert.equal(typeof legacyApi.getConfiguration, "function");

console.log("ModernRBLX2016 compatibility unit checks passed.");
