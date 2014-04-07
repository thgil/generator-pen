var request = require('request');

module.exports = (grunt) ->

  // show elapsed time at the end
  require('time-grunt')(grunt)

  // load all grunt tasks
  require('load-grunt-tasks')(grunt)

  reloadPort = 35729, files;

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    develop:
      server:
        file: 'app.js'

    watch:
      options:
        nospawn: true,
        livereload: reloadPort

      coffee:
        files: ['src/**/*.coffee'],
        tasks: ['coffee:src']

      server:
        files: [
          'app.js',
          'app/**/*.js',
          'config/*.js'
        ],
        tasks: ['develop', 'delayed-livereload']

      js:
        files: ['public/js/*.js'],
        options:
          livereload: reloadPort

      css:
        files: ['public/css/*.css'],
        options:
          livereload: reloadPort

      views:
        files: [ 'app/views/*.jade','app/views/**/*' ]
        options:
          livereload: reloadPort

    coffee:
      src:
        expand: true
        cwd: 'src/app/'
        src: '**/*.coffee'
        dest: 'app/'
        ext: '.js'

      test:
        expand: true
        cwd: 'src/test/'
        src: ['test-creation.coffee', 'test-import.coffee']
        dest: 'test/'
        ext: '.js'

  grunt.registerTask('default', ['develop', 'watch'])
