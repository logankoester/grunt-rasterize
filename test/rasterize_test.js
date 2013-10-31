(function() {
  var grunt;

  grunt = require('grunt');

  exports.environment = {
    setUp: function(done) {
      return done();
    },
    'rasterizing svg to png': function(test) {
      test.expect(2);
      test.ok(grunt.file.exists('test/grunt-small.png'), 'should create a png file');
      test.ok(grunt.file.exists('test/grunt-large.png'), 'should create a png file');
      return test.done();
    }
  };

}).call(this);
