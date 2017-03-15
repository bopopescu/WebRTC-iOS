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

3. Build cd src
```
# debug build for 64-bit iOS
gn gen out/ios_64 --args='target_os="ios" target_cpu="arm64"'

# debug build for simulator
gn gen out/ios_sim --args='target_os="ios" target_cpu="x64"'
```

3. Compile with ninja
```
// ninja -C out/ios_64 AppRTCMobile
// Compile as framework
ninja -C out/ios_64 rtc_sdk_framework_objc
```