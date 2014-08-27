module.exports = (grunt) ->
  development: [
    '<%= grunt.publicDir %>/**/*'
    '!<%= grunt.publicDir %>/config.xml'
    '!<%= grunt.publicDir %>/package.json'
    'access_logs.db'
  ]
  production: [
    '<%= grunt.publicDir %>/scripts'
  ]
  desktop: [
    '<%= grunt.nodeWebkitDir %>'
  ]
