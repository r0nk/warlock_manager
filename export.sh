#!/bin/bash

#export index.html
#godot --headless --export-release "Web" export/index
#zip into export.zip
zip export/export.zip export/*
butler push export/export.zip r0nk/warlock-manager:web
