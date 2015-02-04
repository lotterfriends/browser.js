module.exports = (grunt) ->
  
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    uglify:
      options:
        banner: '/*! <%= pkg.name %> <%= pkg.version %> */\n'
      build:
        src: 'lib/browser.js'
        dest: 'lib/browser.min.js'
    coffee:
      compile:
        options:
          banner: '/*! <%= pkg.name %> <%= pkg.version %> */\n'
          join: yes
        files:
          'lib/browser.js': [
            'src/browser.coffee'
          ]
    bumpup: 'package.json'
    watch:
      coffeescripts:
        files: [
          'src/browser.coffee'
        ]
        tasks: ['coffee']
        options:
          livereload: true
  
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-bumpup'

  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'release', ['bump', 'coffee', 'uglify']

  grunt.registerTask 'bump', (type) ->
    type = if type then type else 'patch'
    grunt.task.run "bumpup:#{type}"
