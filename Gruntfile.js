"use strict";

module.exports = function (grunt) {

    // display execution time of grunt tasks
    require("time-grunt")(grunt);

    // load all grunt tasks matching the `grunt-*` pattern
    require('load-grunt-tasks')(grunt);


    // configurations for grunt packages
    grunt.initConfig({

        // jshint locations
        jshint: {

        },

        // watch files
        watch: {

        },

        // express settings
        express: {
            dev: {
                options: {
                    script: "server.js",
                    debug: true
                }
            }

        },

        // environmentals
        env: {
            development: {
                NODE_ENV: "development"
            },
            integration: {
                NODE_ENV: "integration"
            }
        }
    });

    // custom tasks
    grunt.registerTask("startdev", "start server in dev", [
        "jshint",
        "env:development",
        "express:dev",
        "watch"
    ]);

    grunt.registerTask("startint", "startup server in integration", [
        "jshint",
        "env:integration",
        "express:dev",
        "watch"
    ]);
};
