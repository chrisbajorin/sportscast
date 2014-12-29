"use strict";
//
// Merge base and environment configs
//

// Packages
var _ = require("underscore");


module.exports = _.extend(
    require("./env/all"),
    require("./env/" + process.env.NODE_ENV || {})
);
