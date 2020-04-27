#!/bin/bash -l

# TODO: Add more configs
# TODO: Parameterize the run command

#Set default driver to broswerstack
export WEB_DRIVER=browserstack

echo 'Windows 7 IE'
export BS_CONFIG=win7ie
cucumber --format json --out report_win7ie.json --format pretty --tags @af

echo 'Windows 10 Edge'
export BS_CONFIG=win10edge
cucumber --format json --out report_win10edge.json --format pretty --tags @af

echo 'Windows 10 Firefox'
export BS_CONFIG=single
cucumber --format json --out report_win10ff.json --format pretty --tags @af

#Set default driver back to chrome
export WEB_DRIVER=chrome