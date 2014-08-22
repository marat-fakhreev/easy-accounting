module.exports = (grunt) ->
  grunt.registerTask 'server', (target) ->
    if target is 'development'
      grunt.task.run [
        'easymock'
        'watch:development'
      ]
    if target is 'production'
      grunt.task.run [
        'easymock'
        'watch:production'
      ]
