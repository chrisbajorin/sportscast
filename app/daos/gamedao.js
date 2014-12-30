"use strict";

var mongoose = require("mongoose");
var Game = mongoose.model("Game");

exports.findAllGames = function(teamId, location, next) {

    if (location === "home") {

        Game.find({"homeTeam.id": teamId}, next);
    }
    else if (location === "away") {

        Game.find({"awayTeam._id": teamId}, next);
    }
};
