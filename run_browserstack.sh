#!/bin/bash -l

function run_browser_tests() {
  cucumber --format json --out report_$BS_CONFIG.json --format pretty --tags @browser
}

#Set default driver to broswerstack
export WEB_DRIVER=browserstack

# Windows Configs
echo 'Windows 7 IE'
export BS_CONFIG=win7_ie
run_browser_tests

echo 'Windows 10 Edge'
export BS_CONFIG=win10_edge
run_browser_tests

echo 'Windows 10 Firefox'
export BS_CONFIG=win10_ff
run_browser_tests

echo 'Windows 10 Chrome'
export BS_CONFIG=win10_chrome
run_browser_tests

# Mac OS Configs
echo 'Mac OS Safari 12'
export BS_CONFIG=mac_safari12
run_browser_tests

echo 'Mac OS Firefox'
export BS_CONFIG=mac_ff
run_browser_tests

echo 'Mac OS Chrome'
export BS_CONFIG=mac_chrome
run_browser_tests

# iOS Confings
echo 'iOS Chrome'
export BS_CONFIG=ios_chrome
run_browser_tests

echo 'iOS Safari'
export BS_CONFIG=ios_safari
run_browser_tests

# Android Confings
echo 'Android Chrome'
export BS_CONFIG=android_chrome
run_browser_tests

echo 'Android Samsung Internet'
export BS_CONFIG=android_samsung
run_browser_tests

#Set default driver back to chrome
export WEB_DRIVER=chrome