module.exports = (grunt) ->
  unit:
    options:
      basePath: ''
      runnerPort: '<%= grunt.ports.specs %>'
      singleRun: true
      colors: true
      reporters: ['dots']

      preprocessors:
        'specs/**/*.coffee': ['coffee']

      frameworks: [
        'requirejs'
        'jasmine'
        'sinon'
      ]

      browsers: [
        'PhantomJS'
      ]

      files: [
        {pattern: '<%= grunt.publicDir %>/scripts/bower_components/**/*.js', included: false}
        {pattern: '<%= grunt.publicDir %>/scripts/vendor/**/*.js', included: false}
        {pattern: '<%= grunt.publicDir %>/scripts/**/*.js', included: false}
        {pattern: '<%= grunt.testDir %>/**/*_spec.coffee', included: false}
        '<%= grunt.testDir %>/runner.coffee'
      ]

      plugins: [
        'karma-sinon'
        'karma-jasmine'
        'karma-requirejs'
        'karma-phantomjs-launcher'
        'karma-coffee-preprocessor'
      ]
