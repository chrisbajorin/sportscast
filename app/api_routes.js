"use strict";
//
// API Routing
//

// Controllers
var gamesWebController = require("./webcontrollers/gamewebcontroller");


// Routes
module.exports = function (app) {

    app.get("/api/games", gamesWebController.findAllGames);
};
