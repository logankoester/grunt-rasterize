(function() {
  var fs, grunt, path, pngExists;

  grunt = require('grunt');

  fs = require('fs');

  path = require('path');

  pngExists = function(file, test) {
    test.expect(2);
    test.ok(grunt.file.exists(file), 'should create a png file');
    return fs.stat(file, function(err, stats) {
      test.notEqual(stats.size, 0, "" + file + " should not be an empty file");
      return test.done();
    });
  };

  exports.environment = {
    'rasterizing grunt-small.png': function(test) {
      var file;
      file = path.join('test', 'grunt-small.png');
      return pngExists(file, test);
    },
    'rasterizing grunt-large.png': function(test) {
      var file;
      file = path.join('test', 'grunt-large.png');
      return pngExists(file, test);
    }
  };

}).call(this);
