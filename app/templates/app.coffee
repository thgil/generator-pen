express = require('express'),
bookshelf = require('bookshelf'),
fs = require('fs'),
config = require('./config/config');

mongoose.connect(config.db);
var db = mongoose.connection;
db.on('error', function () {
  throw new Error('unable to connect to database at ' + config.db);
});

var modelsPath = __dirname + '/app/models';
fs.readdirSync(modelsPath).forEach(function (file) {
  if (file.indexOf('.js') >= 0) {
    require(modelsPath + '/' + file);
  }
});

var app = express();

require('./config/express')(app, config);

var controllersPath = __dirname + '/app/controllers';
fs.readdirSync(controllersPath).forEach(function (file) {
  if (file.indexOf('.js') >= 0) {
    require(controllersPath + '/' + file)(app);
  }
});

app.listen(config.port);
