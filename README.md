# Sauce Labs App Automate Github Actions 


A `GitHub` Action to test mobile applications `Android` using `Sauce Labs` App Automate using `Sauce Runner`.

<br>

Inspired by the 2020 [GitHub Actions Hackathon.](https://githubhackathon.com/)

<br>

## Introduction
Sauce Labs offers the ability to run tests using a native framework such as Espresso on virtual devices using the Sauce Runner for Virtual Devices.

<br>


## Pre-requisites

1. `Sauce Labs Access Key`: A service account is a special kind of account with specific permissions to authenticate with the Cloud Platform when used on a virtual machine for continuous integration.

2. `ARG SPEC File`: A YAML argument file that lists out all of the configurations for Sauce Labs Runner. In this file, you can specify the APK, test APK , select virtual devices , the data center location and indicate the type of test to perform.

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

## The purpose of the integration between Bitrise and SauceLabs

If you are writing mobile test automation scripts for your `Android` app using the native tool `Espresso` and you need to run your tests with different `OS` and `versions` on different simulators with `Bitrise`, So you need to think about how can I run these tests, if you start thinking about implementing your device lab it will be a headache and will not give the value that you looking for, So you need to think about alternate solution that supports you with different devices, OS and versions. one of these solutions is SauceLabs

`Sauce Labs` offers the ability to run tests using a native framework such as Espresso on virtual devices using the `Sauce Runner for Virtual Devices`.

### Note:
> Sauce Runner is now supporting only Espresso and Virtual Devices. 

Before implementing this step to use `SauceLab Runner` you need to create your custom scripts to download the runner zipped file, `unzip` it and running the command using a `shell` script.
But with the step, all that you need is to add the step in your workflow and select your preferred device.

## Usage
workflows/main.yml:
```
name: Android CI
on: [push]

jobs:
  hello_world_job:
    runs-on: ubuntu-latest
    name: A job to say hello
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Hello world action step
        uses: moatazeldebsy/auce-labs-app-automate-action@v1.0.0
        id: hello
        with:
          apk_path: 'app-debug.apk'
          test_apk_path: 'app-debug-androidTest.apk'
          device_name: 'Google Pixel GoogleAPI Emulator,platformVersion=7.0'
          data_center: 'eu-central-1'
        env:
          SAUCELABS_ACCESS_KEY: ${{ secrets.SAUCELABS_ACCESS_KEY }}
          SAUCELABS_USERNAME: ${{ secrets.SAUCELABS_USERNAME }}
```

<br>

The following usage comes with additional instructions regarding the input and environment variables that can be found in the [Simple Usage Documentation](/docs/SIMPLE_USAGE.md).

Currently, this GitHub Action only runs Android tests. Support for iOS coming soon.

<br>

## Inputs

#### `arg-spec`

YAML file that contains configuration for Firebase Test Lab. Format must be ARG_FILE:ARG_GROUP_NAME. **Required**

#### `SERVICE_ACCOUNT`

Copy-paste the content of the JSON-formatted service account file in GitHub's secret variables in settings. **Required**

<br>

**Upcoming feature**
- Include/Exclude Tests
- Run-on multiple devices
- Run with Sauce Labs tunnel 

<br>
## Contributing

Are you facing an issue? Have some questions? Would like to implement a new feature? Learn more about our [contributing guidelines](CONTRIBUTING.md).

<br>

## Licence

The project is released under the [MIT License](LICENSE).