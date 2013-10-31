grunt = require 'grunt'

exports.environment =
  setUp: (done) ->
    done()

  'rasterizing svg to png': (test) ->
    test.expect 2

    test.ok grunt.file.exists('test/grunt-small.png'), 'should create a png file'
    test.ok grunt.file.exists('test/grunt-large.png'), 'should create a png file'

    test.done()
