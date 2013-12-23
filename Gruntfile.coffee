module.exports = (grunt) ->
  grunt.initConfig(
    pkg: grunt.file.readJSON('package.json'),
    coffee:
      compile:
        files:
          'mdserv': 'mdserv.coffee'
  )

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.registerTask('default', ['coffee'])
  grunt.registerTask('build', ['coffee'])
