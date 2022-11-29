#! /bin/bash

# This program is to do a clean pod installation
flutter clean
flutter pub get
cd ios
rm Podfile.lock
rm -rf Pods
pod cache clean --all
pod deintegrate
pod setup
# To get OS Type
unamestr=$(uname)
# To get Architecture Types
archtype=$(uname -m)

# If it is arm architecture macos then it will required arch -x86_64 pod install
if [[ "$unamestr" == "Darwin" ]]; then
    if [[ "$archtype" == "arm64" ]]; then
        arch -x86_64 pod install
    else
        pod install
    fi
else
    pod install
fi