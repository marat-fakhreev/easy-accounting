# Phonegap-base application

## Prepare environment

Install Node.js

    brew install node

Install Grunt CLI

    npm install -g grunt-cli

Install Bower

    npm install -g bower

Install PhoneGap

    sudo npm install -g phonegap

## Prepare repository

    git clone git@github.com:maratfakhreev/phonegap-base.git phonegap-base
    cd phonegap-base
    sh bin/install.sh

## Build application

Build application and start mocks server

    grunt                //development version
    grunt development    //development version
    grunt staging        //staging version
    grunt production     //production version

Build application

    grunt build:development    //development version
    grunt build:staging        //staging version
    grunt build:production     //production version

Run tests

    grunt test

## Run on iOS

Open Xcode project: `phonegap-base/platforms/ios/GGR fleet manager.xcodeproj` or use phonegap command:

    phonegap run ios

### Additional commands

Open safari webinspector for iPhone Simulator

    grunt w:iphone

Open safari webinspector for iPad Simulator

    grunt w:ipad

## Run on Android

Install the [Android SDK](developer.android.com/sdk)

Install Ant:

    brew install ant

On OSX or Linux, you can use a text editor to create or modify the ~/.bash_profile file, adding a line such as the following:

    export PATH=${PATH}:/Development/adt-bundle/sdk/platform-tools:/Development/adt-bundle/sdk/tools

Add the paths for java and ant if needed and this line in ~/.bash_profile

    $ source ~/.bash_profile

Use next command for prepare environment:

    android

[Create Android virtual device](http://docs.phonegap.com/en/edge/guide_platforms_android_index.md.html#Android%20Platform%20Guide)

Install [Genymotion](http://www.genymotion.com/) and add Android 4.4.2 device (MotoX for example)

[How to debug application on android](https://developers.google.com/chrome-developer-tools/docs/remote-debugging#debugging-webviews)

### Run

    phonegap run android
