grunt = require 'grunt'
fs = require 'fs'
path = require 'path'

pngExists = (file, test) ->
  test.expect 2
  test.ok grunt.file.exists(file), 'should create a png file'
  fs.stat file, (err, stats) ->
    test.notEqual stats.size, 0, "#{file} should not be an empty file"
    test.done()

exports.environment =
  'rasterizing grunt-small.png': (test) ->
    file = path.join 'test', 'grunt-small.png'
    pngExists(file, test)

  'rasterizing grunt-large.png': (test) ->
    file = path.join 'test', 'grunt-large.png'
    pngExists(file, test)

  'rasterizing grunt-nowidth.png': (test) ->
    file = path.join 'test', 'grunt-nowidth.png'
    pngExists(file, test)
