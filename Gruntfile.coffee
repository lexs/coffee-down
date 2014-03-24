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

    requirejs:
      production:
        options:
          baseUrl: 'build/public/js'
          mainConfigFile: 'build/public/js/main.js'
          name: 'main'
          out: 'build/public/js/optimized.js'
          optimize: 'uglify2'

    clean: ['build/']

    watch:
      scripts:
        files: ['**/*.coffee']
        tasks: ['coffee']
      less:
        files: ['assets/**/*.less']
        tasks: ['less']

    nodemon:
      development:
        script: 'build/server.js'
        options:
          env:
            DEBUG: true

    concurrent:
      development: ['watch', 'nodemon']
      options:
        logConcurrentOutput: true

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.registerTask 'build', ['coffee', 'less', 'requirejs:production']
  grunt.registerTask 'dev', ['coffee', 'less', 'concurrent:development']

  grunt.registerTask 'heroku:production', 'build'

  grunt.registerTask 'default', 'build'
