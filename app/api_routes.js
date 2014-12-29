"use strict";
//
// API Routing
//

module.exports = function (app) {

    app.get("/", function(req, res) {
        console.log(req);
        console.log(res);
    });

};
