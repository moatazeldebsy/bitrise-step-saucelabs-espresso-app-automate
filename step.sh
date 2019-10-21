#!/bin/bash
set -ex

echo "starting automated tests"
#wget https://saucelabs.com/downloads/sauce-runner-virtual-0.1.1-linux.zip
wget https://saucelabs.com/downloads/sauce-runner-virtual-0.1.1-osx.zip

unzip sauce-runner-virtual-0.1.1-osx.zip
./sauce-runner-virtual-0.1.1-osx/bin/sauce-runner-virtual  -u $SAUCE_USERNAME  -k $SAUCE_ACCESS_KEY  -f $test_framework  -a $BITRISE_APK_PATH  -t $BITRISE_TEST_APK_PATH -d "$saucelabs_devices" \
   --data-center $data_center \
   -e "$exclude_tests" \
   -i "$include_tests"