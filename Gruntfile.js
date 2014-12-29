"use strict";

module.exports = function (grunt) {

    // display execution time of grunt tasks
    require("time-grunt")(grunt);

    // load all grunt tasks matching the `grunt-*` pattern
    require("load-grunt-tasks")(grunt);


    // configurations for grunt packages
    grunt.initConfig({

        //jshint
        jshint: {
            options: {
                jshintrc: ".jshintrc"
            },
            all: [
                "server.js",
                "Gruntfile.js",
                "app/*",
                "config/*"
            ]
        },

        // watch files
        watch: {
            options: {
                livereload: true
            },
            express: {
                files: ["server.js", "app/**"],
                tasks: ["express:dev"],
                options: {
                    nospawn: true
                }
            }
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
    grunt.registerTask("startdev", "start server in development", [
        "jshint",
        "env:development",
        "express:dev",
        "watch"
    ]);

    grunt.registerTask("startint", "startup server in integration", [
        "env:integration",
        "express:dev",
        "watch"
    ]);
};
