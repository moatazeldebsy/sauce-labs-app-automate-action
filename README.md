# Sauce Labs App Automate Github Actions 

[![Release](https://img.shields.io/github/release/moatazeldebsy/sauce-labs-app-automate-action.svg)](https://github.com/moatazeldebsy/sauce-labs-app-automate-action/releases)
[![Marketplace](https://img.shields.io/badge/GitHub-Marketplace-blue.svg)](https://github.com/marketplace/actions/sauce-labs-app-automate-action)

A `GitHub` Action for running `Espresso` Tests for `Android` using `Sauce Labs Runner`

Inspired by the 2020 [GitHub Actions Hackathon.](https://githubhackathon.com/)

<br>

## Introduction
Sauce Labs offers the ability to run tests using a native framework such as Espresso on virtual devices using the Sauce Runner for Virtual Devices.

<br>

## Pre-requisites

1. `Sauce Labs Access Key` 
2. `Sauce Labs Username` 
3. Application `APK` and `Test APK`

<br>

## What is Sauce Labs?

The world's largest continuous testing cloud of web and mobile applications. Access web browsers, mobile emulators, simulators, and real mobile devices.

[Sauce Labs](https://saucelabs.com/) Continuous Testing Cloud enables development and quality teams to test up to 10x faster. Sauce Labs provides the comprehensive coverage, scalability, and analytics required to rapidly deliver a flawless user experience.

### Create Sauce Labs Free (Trial) Account
You can create your trial account from this link:

[https://saucelabs.com/sign-up](https://saucelabs.com/sign-up)

**The Free trial account includes:**

Start testing today on thousands of `browser/OS` platform combinations, `EMU/SIM` and real `Android` and `iOS` devices.

* Instant access to 900+ desktop browser & OS combos
* Instant access to 200+ mobile emulators & simulators100 minutes of automated testing
* Instant access to real mobile devices
* 1 session on the Real Device Cloud
* 2 concurrent sessions on the Virtual Device Cloud
* 100 minutes of automated testing

## The purpose of the integration between GitHub Actions and SauceLabs

If you are writing mobile test automation scripts for your `Android` app using the native tool `Espresso` and you need to run your tests with different `OS` and `versions` on different simulators with `Sauce Labs`, So you need to think about how can I run these tests, if you start thinking about implementing your device lab it will be a headache and will not give the value that you looking for, So you need to think about alternate solution that supports you with different devices, OS and versions. one of these solutions is SauceLabs

`Sauce Labs` offers the ability to run tests using a native framework such as Espresso on virtual devices using the `Sauce Runner for Virtual Devices`.

### Note:
> Sauce Runner is now supporting only Espresso and Virtual Devices. 

Before implementing this step to use `SauceLab Runner` you need to create your custom scripts to download the runner zipped file, `unzip` it and running the command using a `shell` script.
But with the step, all that you need is to add the step in your workflow and select your preferred device.

## Usage

workflows/main.yml:

```yaml
name: Android CI
on: [push]

jobs:
  Sauce Labs App Automate:
    runs-on: ubuntu-latest
    name: A job to say hello
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Hello world action step
        uses: moatazeldebsy/sauce-labs-app-automate-action@V1.0.1
        id: sauceLabs Test
        with:
          apk_path: 'app/build/outputs/apk/debug/app-debug.apk'
          test_apk_path: 'app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk'
          device_name: 'Google Pixel GoogleAPI Emulator,platformVersion=7.0'
          data_center: 'eu-central-1'
        env:
          SAUCELABS_ACCESS_KEY: ${{ secrets.SAUCELABS_ACCESS_KEY }}
          SAUCELABS_USERNAME: ${{ secrets.SAUCELABS_USERNAME }}
```

<br>

## Usage with Android Gradle to build your app

workflow/android.yml:

```yaml
name: Android CI

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: set up JDK 1.8
      uses: actions/setup-java@v1
      with:
        java-version: 1.8
    - name: Build with Gradle
      run: ./gradlew assemble assembleAndroidTest
    - name: Sauce Labs App Automate Action
      uses: moatazeldebsy/sauce-labs-app-automate-action@V1.0.1
      with:
        apk_path: 'app/build/outputs/apk/debug/app-debug.apk'
        test_apk_path: 'app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk'
        data_center: 'eu-central-1'
        device_name: 'Google Pixel GoogleAPI Emulator,platformVersion=7.0'
      env:
          SAUCELABS_ACCESS_KEY: ${{ secrets.SAUCELABS_ACCESS_KEY }}
          SAUCELABS_USERNAME: ${{ secrets.SAUCELABS_USERNAME }}

```

## Inputs

- **apk_path**:  The path for your application APK for ex: (`path/to/app-debug.apk`)
- **test_apk_pat**h: The path for your test APK for ex: (`path/to/app-debug-androidTest.apk`)
- **device_name**: The **virtual** device name and version from Sauce Labs for ex: (`Google Pixel GoogleAPI Emulator,platformVersion=7.0`)
- **data_center**: The Sauce Labs data center that you need to run your tests with ex: (`eu-central-1,us-west-1 or headless-us-east`)

#### env:
- **Sauce Labs Username**: Your Username as an **environment variable** (`GitHub secret`)
- **Sauce Labs Access Key**: Your Access Key as an **environment variable** (`GitHub secret`)

Learn how to create and store encrypted secrets on GitHub from [here](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets)

<br>

### Upcoming features
- Include/Exclude Tests
- Run-on multiple devices
- Run with Sauce Labs tunnel 

<br>

## Contributing

Are you facing an issue? Have some questions? Would like to implement a new feature? Learn more about our [contributing guidelines](CONTRIBUTING.md).

<br>

## Licence

The project is released under the [MIT License](LICENSE).