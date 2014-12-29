"use strict";

//
// Express environment configurations
//

// Modules
var path = require("path");

// Packages
var express = require("express");
var bodyParser = require("body-parser");
var morgan = require("morgan");
var methodOverride = require("method-override");
var cookieParser = require("cookie-parser");

// Local dependencies



// express middleware
module.exports = function (app) {

    var env = app.get("env");

    //
    // Development
    //
    if (env === "development") {

         app.use(morgan("dev"));
    }

    //
    // Integration
    //
    if (env === "integration") {

        app.use(morgan("dev"));
    }

    //
    // Shared
    //
    app.use(bodyParser.json()); // move bodyParser to api routes as middleware?
    app.use(bodyParser.urlencoded({ extended: false}));
    app.use(methodOverride());
    app.use(cookieParser());




};
