"use strict";

// Services
var gameService = require("../services/gameservice");



exports.findAllGames = function(req, res) {

    var teamId = req.query.teamId;
    var location = req.query.location; // home or away

    gameService.findAllGames(teamId, location, responseCallback(res));
};


//
// Privates
//

function responseCallback(res) {

    return function(error, returnValue) {

        if (error) {

            res.json(500, error);
        } else {

            res.json(200, returnValue);
        }
    };

}
