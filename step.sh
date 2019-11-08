#!/bin/bash
set -ex
echo "Downloading Saucelabs Runner for Virtual Devices"

wget https://saucelabs.com/downloads/sauce-runner-virtual-0.1.1-linux.zip

unzip sauce-runner-virtual-0.1.1-linux.zip

echo "starting uploading app and test apk to Saucelabs and run the automated tests"

./sauce-runner-virtual-0.1.1-linux/bin/sauce-runner-virtual  -u $SAUCE_USERNAME  -k $SAUCE_ACCESS_KEY \
  -f espresso \
  -a $BITRISE_APK_PATH \
  -t $BITRISE_TEST_APK_PATH \
  --devices "${SAUCELABS_DEVICE_LIST}" \
  --data-center $DATA_CENTER