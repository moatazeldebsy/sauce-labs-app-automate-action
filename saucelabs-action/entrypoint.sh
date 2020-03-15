#!/bin/bash
set -ex
echo "Downloading Saucelabs Runner for Virtual Devices"

wget https://saucelabs.com/downloads/sauce-runner-virtual-0.1.1-linux.zip

unzip sauce-runner-virtual-0.1.1-linux.zip

echo "starting uploading app and test apk to Saucelabs and run the automated tests"

  ./sauce-runner-virtual-0.1.1-linux/bin/sauce-runner-virtual  -u $SAUCELABS_USERNAME  -k $SAUCELABS_ACCESS_KEY \
  -f espresso -a $apk_path \
  -t $test_apk_path -d "deviceName=${device_name}" --data-center ${data_center}
