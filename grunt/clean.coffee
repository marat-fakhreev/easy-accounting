module.exports = (grunt) ->
  development: [
    '<%= grunt.publicDir %>/**/*'
    '!<%= grunt.publicDir %>/config.xml'
    'access_logs.db'
  ]
  production: [
    '<%= grunt.publicDir %>/scripts'
  ]
