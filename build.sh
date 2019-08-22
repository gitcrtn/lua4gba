#!/usr/bin/env bash
cd /opt/lua4gba
cp -r /pwd/filesystem .
./build.sh
cp lua52.gba /pwd
