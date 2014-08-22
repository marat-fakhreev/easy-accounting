tests = []

for file of window.__karma__.files
  tests.push file if /_spec\.js$/.test(file)

requirejs.config
  baseUrl: 'scripts'
  paths:
    'jquery': 'bower_components/jquery/dist/jquery'
    'underscore': 'bower_components/underscore/underscore'
    'backbone': 'bower_components/backbone/backbone'
    'backbone.routefilter': 'bower_components/backbone-route-filter/backbone-route-filter'
    'backbone.stickit': 'bower_components/backbone.stickit/backbone.stickit'
    'backbone-validation': 'bower_components/backbone-validation/dist/backbone-validation-amd'
    'backbone-nested-model': 'bower_components/backbone-nested-model/backbone-nested'
    'marionette': 'bower_components/marionette/lib/backbone.marionette'
    'moment': 'bower_components/moment/moment'
    'moment-timezone': 'bower_components/moment-timezone/builds/moment-timezone-with-data'
    'fastclick': 'bower_components/fastclick/lib/fastclick'
    #vendor
    'jade': 'vendor/scripts/runtime'
    'jquery-mobile': 'vendor/scripts/jquery.mobile.custom'
    'touchswipe': 'vendor/scripts/touchswipe'
  shim:
    'marionette':
      deps: ['backbone']
    'touchswipe':
      deps: ['jquery']
    'templates':
      deps: ['jade']

  # ask Require.js to load these files (all our tests)
  deps: tests

  # start test run, once Require.js is done
  callback: window.__karma__.start
