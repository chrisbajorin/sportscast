"use strict";

var mongoose = require("mongoose");
var Schema = mongoose.Schema;

var GameSchema = new Schema({
    homeTeam: {
        name: String,
        _id: mongoose.Schema.Types.ObjectId
    },
    awayTeam: {
        name: String,
        _id: mongoose.Schema.Types.ObjectId
    },
    stadium: {
        name: String,
        address: String,
        _id: mongoose.Schema.Types.ObjectId
    },
    date: Date
});

module.exports = mongoose.model("Game", GameSchema);
