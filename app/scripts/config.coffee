requirejs.config
  baseUrl: 'scripts'
  paths:
    'jquery': 'bower_components/jquery/dist/jquery'
    'jquery-hammerjs': 'bower_components/jquery-hammerjs/jquery.hammer'
    'hammerjs': 'bower_components/hammerjs/hammer'
    'underscore': 'bower_components/underscore/underscore'
    'backbone': 'bower_components/backbone/backbone'
    'backbone.routefilter': 'bower_components/backbone-route-filter/backbone-route-filter'
    'backbone.stickit': 'bower_components/backbone.stickit/backbone.stickit'
    'backbone-validation': 'bower_components/backbone-validation/dist/backbone-validation-amd'
    'backbone-nested-model': 'bower_components/backbone-nested-model/backbone-nested'
    'backbone.hammer': 'bower_components/backbone.hammer/backbone.hammer'
    'marionette': 'bower_components/marionette/lib/backbone.marionette'
    'moment': 'bower_components/moment/moment'
    'moment-timezone': 'bower_components/moment-timezone/builds/moment-timezone-with-data'
    'fastclick': 'bower_components/fastclick/lib/fastclick'
    'spinner': 'bower_components/spinjs/spin'
    #vendor
    'jade': 'vendor/scripts/runtime'
    'jquery-mobile': 'vendor/scripts/jquery.mobile.custom'
    'touchswipe': 'vendor/scripts/touchswipe'
  shim:
    'marionette':
      deps: [
       'backbone'
       'backbone.hammer'
      ]
    'touchswipe':
      deps: ['jquery']
    'templates':
      deps: ['jade']
