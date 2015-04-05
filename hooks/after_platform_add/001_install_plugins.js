#!/usr/bin/env node

var pluginlist = [
  "org.apache.cordova.camera",
  "org.apache.cordova.device",
  "org.apache.cordova.dialogs",
  "org.apache.cordova.geolocation",
  "org.apache.cordova.network-information",
  "org.apache.cordova.splashscreen",
  "https://github.com/whiteoctober/cordova-plugin-app-version.git",
  "https://github.com/VitaliiBlagodir/cordova-plugin-datepicker"
];

var fs = require('fs');
var path = require('path');
var sys = require('sys');
var execSync = require('sync-exec');

function puts(error, stdout, stderr) {
  sys.puts(stdout)
}

pluginlist.forEach(function(plug) {
  console.log('Installing ' + plug);
  execSync("cordova plugin add " + plug);
});
