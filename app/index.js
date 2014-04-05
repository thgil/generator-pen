'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');
var chalk = require('chalk');


var PenGenerator = yeoman.generators.Base.extend({
  init: function () {
    this.pkg = require('../package.json');

    this.on('end', function () {
      if (!this.options['skip-install']) {
        this.installDependencies();
      }
    });
  },

  // coffee: function () {
  //   var done = this.async();
  //   var prompt = [{
  //     type: 'confirm',
  //     name: 'coffee',
  //     message: 'Would you like to use CoffeeScript?',
  //     default: true
  //   }];
  //
  //   this.prompt(prompt, function (responses) {
  //     this.options.coffee = responses.coffee;
  //     done();
  //   }.bind(this));
  // },

  app: function () {
    this.directory('app', 'app');

    this.copy('_package.json', 'package.json');
    this.copy('_bower.json', 'bower.json');
  },

  projectfiles: function () {
    this.copy('editorconfig', '.editorconfig');
    this.copy('jshintrc', '.jshintrc');

    this.copy('Gruntfile.js', 'Gruntfile.js');
  },

  publicassets : function () {
    this.mkdir('public/js');
    this.mkdir('public/css');
    this.mkdir('public/img');
  },

  h5bp : function () {
    // this.copy('favicon.ico', 'app/favicon.ico');
    // this.copy('404.html', 'app/404.html');
    // this.copy('robots.txt', 'app/robots.txt');
    // this.copy('htaccess', 'app/.htaccess');
  },

  git : function () {
    this.copy('gitignore', '.gitignore');
    this.copy('gitattributes', '.gitattributes');
  }

});

module.exports = PenGenerator;
