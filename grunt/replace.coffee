module.exports = (grunt) ->
  local:
    options:
      patterns: [
        match: 'environment'
        replacement: 'local'
      ]
    files: [
      expand: true
      flatten: true
      src: ['<%= grunt.publicDir %>/scripts/settings/settings.js']
      dest: '<%= grunt.publicDir %>/scripts/settings/'
    ]
  staging:
    options:
      patterns: [
        match: 'environment'
        replacement: 'staging'
      ]
    files: [
      expand: true
      flatten: true
      src: ['<%= grunt.publicDir %>/scripts/settings/settings.js']
      dest: '<%= grunt.publicDir %>/scripts/settings/'
    ]
  production:
    options:
      patterns: [
        match: 'environment'
        replacement: 'production'
      ]
    files: [
      expand: true
      flatten: true
      src: ['<%= grunt.publicDir %>/scripts/settings/settings.js']
      dest: '<%= grunt.publicDir %>/scripts/settings/'
    ]
