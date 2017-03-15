# Running the server

## Prepare and build app server
```
cd WebRTC-Server

npm install

npm -g install grunt-cli

grunt build
```
## Download Google cloud python SDK and run server

```
cd [root]
python google-cloud-sdk/bin/dev_appserver.py ./WebRTC-Server/out/app_engine/
sudo python google-cloud-sdk/bin/dev_appserver.py ./WebRTC-Server/out/app_engine/
# optional --host 9.108.160.121 --port=80  (HTTPS required for local network)

// Deployement
google-cloud-sdk/bin/gcloud auth login
google-cloud-sdk/bin/gcloud config set project YOUR_PROJECT_ID
google-cloud-sdk/bin/gcloud app deploy ./WebRTC-Server/out/app_engine/app.yaml 

```

# WebRTC iOS build
https://github.com/Anakros/WebRTC

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

* Official server end
https://github.com/webrtc/apprtc

* Talky iOS demo
https://github.com/otalk
https://github.com/otalk/iOS-demo

* libjingle
https://developers.google.com/talk/libjingle/developer_guide#jingle-and-libjingle

* Broadcast
https://github.com/muaz-khan/WebRTC-Scalable-Broadcast

* Tutorial
https://github.com/ChenYilong/WebRTC/blob/master/WebRTC入门教程/WebRTC入门教程.md