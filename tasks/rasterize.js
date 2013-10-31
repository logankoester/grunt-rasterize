(function() {
  var Inkscape, async, fs;

  fs = require('fs');

  async = require('async');

  Inkscape = require('inkscape');

  module.exports = function(grunt) {
    return grunt.registerMultiTask('rasterize', 'Convert a vector graphic into one or more raster images', function() {
      var done,
        _this = this;
      grunt.log.subhead("Rasterizing " + this.data.vector);
      done = this.async();
      async.each(this.data.raster, function(out) {
        var ink;
        grunt.log.write(" -> " + out.path + " ");
        ink = new Inkscape(['--export-png', "--export-width=" + out.width]);
        out = fs.createWriteStream(out.path);
        fs.createReadStream(_this.data.vector).pipe(ink).pipe(out);
        return grunt.log.ok();
      }, function(err) {
        if (err) {
          grunt.fatal(err);
        }
        return done();
      });
      return grunt.log.writeln();
    });
  };

}).call(this);
