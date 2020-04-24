#!/bin/bash -l

#TODO: Set default driver to BStack

echo 'Windows 7 IE'
export CONFIG_NAME=win7ie
cucumber --format json --out report_win7ie.json --format pretty --tags @af

echo 'Windows 10 Edge'
export CONFIG_NAME=win10edge
cucumber --format json --out report_win10edge.json --format pretty --tags @af

echo 'Windows 10 Firefox'
export CONFIG_NAME=single
cucumber --format json --out report_win10ff.json --format pretty --tags @af

#TODO: Set default driver back to chrome