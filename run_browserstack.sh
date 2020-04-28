#!/bin/bash -l

function run_browser_tests() {
  cucumber --format json --out report_$BS_CONFIG.json --format pretty --tags @browser
}

#Set default driver to broswerstack
export DRIVER=browserstack

# Windows Configs
echo '------------'
echo 'Windows 7 IE'
echo '------------'
export BS_CONFIG=win7_ie
run_browser_tests

echo '---------------'
echo 'Windows 10 Edge'
echo '---------------'
export BS_CONFIG=win10_edge
run_browser_tests

echo '------------------'
echo 'Windows 10 Firefox'
echo '------------------'
export BS_CONFIG=win10_ff
run_browser_tests

echo '-----------------'
echo 'Windows 10 Chrome'
echo '-----------------'
export BS_CONFIG=win10_chrome
run_browser_tests

# Mac OS Configs
echo '----------------'
echo 'Mac OS Safari 12'
echo '----------------'
export BS_CONFIG=mac_safari12
run_browser_tests

echo '--------------'
echo 'Mac OS Firefox'
echo '--------------'
export BS_CONFIG=mac_ff
run_browser_tests

echo '-------------'
echo 'Mac OS Chrome'
echo '-------------'
export BS_CONFIG=mac_chrome
run_browser_tests

# iOS Confings
echo '----------'
echo 'iOS Chrome'
echo '----------'
export BS_CONFIG=ios_chrome
run_browser_tests

echo '----------'
echo 'iOS Safari'
echo '----------'
export BS_CONFIG=ios_safari
run_browser_tests

# Android Confings
echo '--------------'
echo 'Android Chrome'
echo '--------------'
export BS_CONFIG=android_chrome
run_browser_tests

echo '------------------------'
echo 'Android Samsung Internet'
echo '------------------------'
export BS_CONFIG=android_samsung
run_browser_tests

#Set default driver back to chrome
export DRIVER=chrome