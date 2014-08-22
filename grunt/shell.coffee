module.exports = ->
  install:
    options:
      stdout: true
    command:
      'bower install'

  webinspector_ipad:
    options:
      stdout: true
    command:
      'sh bin/webinspector_ipad.sh'

  webinspector_iphone:
    options:
      stdout: true
    command:
      'sh bin/webinspector_iphone.sh'
