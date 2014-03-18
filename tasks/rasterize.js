(function() {
  var Inkscape, async, fs;

  fs = require('fs');

  async = require('async');

  Inkscape = require('inkscape');

  module.exports = function(grunt) {
    return grunt.registerMultiTask('rasterize', 'Convert a vector graphic into one or more raster images', function() {
      var done, rasterize;
      rasterize = (function(_this) {
        return function(out, done) {
          var ink, params;
          grunt.log.write(" -> " + out.path + " ");
          if (out.width) {
            params = ['--export-png', "--export-width=" + out.width];
          } else {
            params = ['--export-png'];
          }
          ink = new Inkscape().on('end', function() {
            return done();
          });
          out = fs.createWriteStream(out.path);
          fs.createReadStream(_this.data.vector).pipe(ink).pipe(out);
          return grunt.log.ok();
        };
      })(this);
      grunt.log.subhead("Rasterizing " + this.data.vector);
      done = this.async();
      return async.eachSeries(this.data.raster, rasterize, function(err) {
        grunt.log.writeln();
        return done();
      });
    });
  };

}).call(this);
