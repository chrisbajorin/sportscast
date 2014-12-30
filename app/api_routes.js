"use strict";
//
// API Routing
//

var gamesWebController = require("./webcontrollers/gamewebcontroller");

module.exports = function (app) {

    app.get("/api/games", gamesWebController.findAllGames);
};
