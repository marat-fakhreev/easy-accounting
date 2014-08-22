module.exports = (grunt) ->
  development:
    files: [
      { expand: true, cwd: '<%= grunt.appDir %>/fonts', dest: '<%= grunt.publicDir %>/fonts', src: '**' }
      { expand: true, cwd: '<%= grunt.appDir %>/images', dest: '<%= grunt.publicDir %>/images', src: '**' }
      { expand: true, cwd: '<%= grunt.appDir %>/stylesheets', dest: '<%= grunt.publicDir %>/stylesheets', src: ['**/*.css', '**/*.png'] }
      { expand: true, cwd: 'bower_components', dest: '<%= grunt.publicDir %>/scripts/bower_components', src: '**' }
      { expand: true, cwd: 'vendor', dest: '<%= grunt.publicDir %>/scripts/vendor', src: '**' }
    ]
  ios:
    files: [
      { expand: true, cwd: '<%= grunt.publicDir %>', dest: '<%= grunt.iosDir %>', src: '**' }
    ]
  android:
    files: [
      { expand: true, cwd: '<%= grunt.publicDir %>', dest: '<%= grunt.androidDir %>', src: '**' }
    ]
