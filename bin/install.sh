#!/bin/bash

npm install
bower install
phonegap build ios
phonegap build android
sh bin/phonegap_plugins.sh
