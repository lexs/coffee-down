module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      client:
        options:
          sourceMap: true
        expand: true,
        cwd: 'client'
        src: ['**/*.coffee']
        dest: 'build/public/js'
        ext: '.js'
      server:
        expand: true,
        cwd: 'server'
        src: ['**/*.coffee']
        dest: 'build/'
        ext: '.js'

    less:
      development:
        options:
          paths: ['bower_components']
        files:
          'build/public/css/main.css': 'assets/**/*.less'

    watch:
      scripts:
        files: ['**/*.coffee']
        tasks: ['coffee']
      less:
        files: ['assets/**/*.less']
        tasks: ['less']

    nodemon:
      dev:
        script: 'build/server.js'
        options:
          env:
            DEBUG: true

    concurrent:
      dev: ['watch', 'nodemon']
      options:
        logConcurrentOutput: true

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks  'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-concurrent'

  grunt.registerTask 'default', ['coffee']
  grunt.registerTask 'dev', ['coffee', 'less', 'concurrent:dev']
