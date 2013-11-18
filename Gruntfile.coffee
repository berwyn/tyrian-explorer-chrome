module.exports = (grunt) ->

  # Project configuration
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    uglify:
      options:
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'

    coffee:
      options:
        sourceMap: true
        bare:  true
      compile:
        files:
          'out/background.js': 'coffee/background.coffee'
          'out/gw2.js': [
            'coffee/app/gw2.coffee'
            'coffee/app/controllers.coffee'
            'coffee/app/directives.coffee'
            'coffee/app/config.coffee'
          ]

    sass:
      dist:
        options:
          sourcemap: true
          style: 'compact'
        files:
          'out/gw2.css': 'sass/gw2.sass'

    copy:
      main:
        files: [
          {expand: true, flatten: true,   src:['app/*'],  dest: 'out/',         filter: 'isFile'}
          {expand: true, cwd: 'vendor/',  src:['**'],     dest: 'out/vendor/',  filter: 'isFile'}
          {expand: true, cwd: 'html/',    src:['**'],     dest: 'out/',         filter: 'isFile'}
        ]

    clean: ['out/']

    watch:
      sass:
        files: ['sass/*.sass']
        tasks: ['sass']
      coffee:
        files: ['coffee/*.coffee']
        tasks: ['coffee']
      static:
        files: ['app/*', 'html/*', 'vendor/*']
        tasks: ['copy']
      all:
        files: ['app/**', 'coffee/**', 'html/**', 'sass/**', 'vendor/**']
        tasks: ['build']

  # Load uglify
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.registerTask 'build', ['clean', 'uglify', 'coffee', 'sass', 'copy']
