module.exports = (grunt) -> 
	
	# Project configuration
	grunt.initConfig {
		pkg: grunt.file.readJSON 'package.json'

		uglify: {
			options: {
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
			}
		}

		coffee: {
			options: {
				sourceMap: true
			}
			compile: {
				files: {
					'out/background.js': 'coffee/background.coffee'
				}
			}
		}

		copy: {
			main: {
				files: [
					{expand: true, flatten: true, src:['html/*'], dest: 'out/', filter: 'isFile'},
					{expand: true, flatten: true, src:['app/*'], dest: 'out/', filter: 'isFile'}
				]
			}
		}

		build: {
			# Fill this out
		}
	}

	# Load uglify
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.registerTask 'default', ['uglify', 'coffee', 'copy']