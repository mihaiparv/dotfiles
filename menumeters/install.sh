#!/usr/bin/env bash
#
# MenuMeters
#
# This installs MenuMeters Preference Pane.

version="1.9.6"
binary=MenuMeters_$version.zip

curl -fsSL https://member.ipmu.jp/yuji.tachikawa/MenuMetersElCapitan/zips/$binary --output $binary
unzip $binary -d ~/Library/PreferencePanes

exit 0
