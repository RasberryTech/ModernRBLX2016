const assert = require("node:assert/strict");
const { BASES } = require("./index");
const { createCompatibilityClient } = require("./client");

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

console.log("ModernRBLX2016 compatibility unit checks passed.");
