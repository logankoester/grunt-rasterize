#
# * grunt-rasterize
# * https://github.com/logankoester/grunt-rasterize
# *
# * Copyright (c) 2013 Logan Koester
# * Licensed under the MIT license.
#

module.exports = (grunt) ->
  grunt.initConfig
    rasterize:
      grunt:
        vector: 'test/fixtures/grunt.svg'
        raster: [
          { path: 'test/grunt-small.png', width: 36 }
          { path: 'test/grunt-large.png', width: 128 }
          { path: 'test/grunt-nowidth.png' }
        ]

    nodeunit:
        tests: ['test/*_test.js']

    coffee:
      tasks:
        expand: true
        cwd: 'src/tasks/'
        src: '**/*.coffee'
        dest: 'tasks/'
        ext: '.js'

      test:
        expand: true
        cwd: 'src/test/'
        src: '**/*.coffee'
        dest: 'test/'
        ext: '.js'

    clean:
      tasks: ['tasks']
      test: ['test']

    copy:
      test_fixtures:
        files: [{
          expand: true
          cwd: 'src/test/fixtures'
          src: ['**/*']
          dest: 'test/fixtures/'
        }]

    watch:
      coffee:
        files: ['src/**/*.coffee', 'Gruntfile.coffee']
        tasks: ['default']

    bump:
      options:
        commit: true
        commitMessage: 'Release v%VERSION%'
        commitFiles: ['package.json']
        createTag: true
        tagName: 'v%VERSION%'
        tagMessage: 'Version %VERSION%'
        push: false
        signTags: true
        signCommits: true


  # Actually load this plugin's task(s).
  grunt.loadTasks 'tasks'

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-nodeunit'
  grunt.loadNpmTasks 'grunt-bump'

  grunt.registerTask 'test', ['rasterize', 'nodeunit']

  grunt.registerTask 'build', ['clean', 'coffee', 'copy']

  grunt.registerTask 'default', ['build', 'test']
