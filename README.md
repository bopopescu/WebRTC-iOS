# Running the server

## Prepare and build app server
```
cd WebRTC-server

npm install

npm -g install grunt-cli

grunt build
```
## Download Google cloud python SDK and run server

```
cd [root]
google-cloud-sdk/bin/dev_appserver.py ./WebRTC-server/out/app_engine/

```

## Visit http://localhost:8080 to test the server is running successfully with Chrome

[Open with chrome](http://localhost:8080)

# Running the iOS client
`
Simply change Config.swift for your settings
`

# Useful docs
* Appear.in tutorial
https://tech.appear.in/2015/05/25/Getting-started-with-WebRTC-on-iOS/
* Client app demo
https://github.com/Mahabali/Apprtc-swift