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

2. Modify .gclient
change .gclient to:

solutions = [{
  'name': 'src',
  'url': 'https://chromium.googlesource.com/chromium/src.git',
  'deps_file': '.DEPS.git',
  'managed': False,
  'custom_deps': {
    # Skip syncing some large dependencies WebRTC will never need.
    'src/chrome/tools/test/reference_build/chrome_linux': None,
    'src/chrome/tools/test/reference_build/chrome_mac': None,
    'src/chrome/tools/test/reference_build/chrome_win': None,
    'src/native_client': None,
    'src/third_party/cld_2/src': None,
    'src/third_party/hunspell_dictionaries': None,
    'src/third_party/liblouis/src': None,
    'src/third_party/pdfium': None,
    'src/third_party/skia': None,
    'src/third_party/trace-viewer': None,
    'src/third_party/webrtc': None,
  },
  'safesync_url': ''
}]
cache_dir = None
target_os = ['ios']

3. Build cd src
```
# debug build for 64-bit iOS
gn gen out/ios_64 --args='target_os="ios" target_cpu="arm64"'

# debug build for simulator
gn gen out/ios_sim --args='target_os="ios" target_cpu="x64"'

# Universal build
gn gen out/Release-universal --args='target_os="ios" target_cpu="x64" additional_target_cpus=["arm", "arm64", "x86"] is_component_build=false is_debug=false ios_enable_code_signing=false'
```



3. Compile with ninja
```
// ninja -C out/ios_64 AppRTCMobile
// Compile as framework
ninja -C out/ios_64 rtc_sdk_framework_objc
```

4. Some more instructions
https://github.com/ChenYilong/WebRTC/blob/master/WebRTC在iOS端的实现/WebRTC在iOS端的实现.md