# Building iOS framework
1. Install chromium tools
```
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.gitexport PATH=$HOME/Documents/tools/depot_tools:"$PATH"
```
2. cd WebRTC-Framework
```
fetch --nohooks webrtc_ios
gclient sync
```

