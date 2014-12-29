"use strict";

// Modules
var fs = require("fs");
var path = require("path");

// Packages
var express = require("express");
var mongoose = require("mongoose");


//
// Server
//

// environment
process.env.NODE_ENV = process.env.NODE_ENV || "development";

// config
var config = require("./config/config");
var app = express();
var db = mongoose.connect(config.mongo.uri, config.mongo.options);
var modelsPath = path.join(__dirname, "app/models");

fs.readdirSync(modelsPath).forEach(function (file) {
    if (/(.*)\.(js$)/.test(file)) {
        require(modelsPath + "/" + file);
    }
});

db.connection.once("connected", function() {

    app.use(function(req, res, next) {
        req.config = config;
        return next();
    });

    // Express settings
    require("./config/express")(app);

    // API routes
    require("./app/api_routes")(app);

    // Start server
    app.listen(config.port, function () {
        console.log("Express server listening on port %d in %s mode", config.port, app.get("env"));
    });
});

exports = module.exports = app;
