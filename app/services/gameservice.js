"use strict";

// DAOS
var gameDAO = require("../daos/gamedao");


exports.findAllGames = function(teamId, location, next) {

    // do your data manipulation stuff in this layer
    // the dao is for accessing the database
    // the webcontroller is just extracting params/body variables

    console.log(teamId);
    console.log(location);

    gameDAO.findAllGames(teamId, location, next);
};
