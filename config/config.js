"use strict";

// Packages
var _ = require("underscore");

//
// Merge base and environment configs
//

module.exports = _.extend(
    require("./env/all"),
    require("./env/" + process.env.NODE_ENV || {})
);
