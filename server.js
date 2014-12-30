"use strict";
//
// Server initialization
//

// Modules
var fs = require("fs");
var path = require("path");

// Packages
var express = require("express");
var mongoose = require("mongoose");

// Environment
process.env.NODE_ENV = process.env.NODE_ENV || "development";
var config = require("./config/config");

// Database
var db = mongoose.connect(config.mongo.uri, config.mongo.options);
var modelsPath = path.join(__dirname, "app/models");

fs.readdirSync(modelsPath).forEach(function (file) {
    if (/(.*)\.(js$)/.test(file)) {
        require(modelsPath + "/" + file);
    }
});

// Server
var app = express();
db.connection.once("connected", function() {

    app.use(function(req, res, next) {
        req.config = config;
        return next();
    });

    // Express settings
    require("./config/express")(app);
    process.env.PORT = config.port;  // in case it's needed when `app` is unavailable

    // API routes
    require("./app/api_routes")(app);

    // Start server
    app.listen(config.port, function () {
        console.log("Express server listening on port %d in %s mode", config.port, app.get("env"));
    });
});

exports = module.exports = app;
