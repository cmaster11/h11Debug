fs = require 'fs'

module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile_all:
        expand: true
        cwd: 'src/'
        src: ['**/*.coffee','!_*','!**/_*.coffee']
        dest: 'build/'
        ext: '.js'
        extDot: 'last'

    coffeelint:
      app: ['src/**/*.coffee']
      options:
        max_line_length:
          level: 'ignore'
        indentation:
          level: 'ignore'

    watch:
      lib:
        files: ['src/**/*.coffee']
        tasks: ['coffeelint','coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffeelint','coffee']

