module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      client:
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

    watch:
      scripts:
        files: ['**/*.coffee']
        tasks: ['coffee']

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
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-concurrent'

  grunt.registerTask 'default', ['coffee']
  grunt.registerTask 'dev', ['coffee', 'concurrent:dev']
