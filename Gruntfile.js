"use strict";

module.exports = function (grunt) {

    // display execution time of grunt tasks
    require("time-grunt")(grunt);

    // load all grunt tasks matching the `grunt-*` pattern
    require('load-grunt-tasks')(grunt);


    // configurations for grunt packages
    grunt.initConfig({

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
    //grunt.registerTask('default', []);

};
