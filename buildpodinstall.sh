#! /bin/bash
# This Program is to do a clean install for deployment uses.
flutter clean
flutter pub get
cd ios
unamestr=$(uname)
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