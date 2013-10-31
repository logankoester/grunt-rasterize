#
# * grunt-rasterize
# * https://github.com/logankoester/grunt-rasterize
# *
# * Copyright (c) 2013 Logan Koester
# * Licensed under the MIT license.
# 

fs = require 'fs'
async = require 'async'
Inkscape = require 'inkscape'

module.exports = (grunt) ->
  
  grunt.registerMultiTask 'rasterize', 'Convert a vector graphic into one or more raster images', ->
    grunt.log.subhead "Rasterizing #{@data.vector}"
    done = @async()

    async.each @data.raster, (out) =>
      grunt.log.write " -> #{out.path} "

      ink = new Inkscape([
        '--export-png',
        "--export-width=#{out.width}"
      ])

      out = fs.createWriteStream(out.path)
      fs.createReadStream(@data.vector).pipe(ink).pipe(out)

      grunt.log.ok()
    , (err) ->

      grunt.fatal err if err
      done()

    grunt.log.writeln()
