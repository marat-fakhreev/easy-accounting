module.exports = (grunt) ->
  desktop:
    options:
      platforms: [
        'win'
        'osx'
      ]
      buildDir: '<%= grunt.nodeWebkitDir %>'
    src: ['<%= grunt.publicDir %>/**/*']
