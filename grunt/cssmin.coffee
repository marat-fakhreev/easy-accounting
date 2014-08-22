module.exports = (grunt) ->
  production:
    files:
      '<%= grunt.publicDir %>/stylesheets/style.css': '<%= grunt.publicDir %>/stylesheets/style.css'
