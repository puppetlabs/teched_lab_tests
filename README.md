# teched_lab_tests

## Table of Contents

1. [Description](#description)
1. [Requirements](#requirements)
1. [Usage](#usage)
1. [Development](#usage)

## Description

This module contains tests for Puppet TechEd lab nodes.

## Requirements

To run these tests, you will need to install the Puppet Development Kit (PDK).

See the official Puppet documentation for instructions:

- [Installing the Puppet Development Kit](https://www.puppet.com/docs/pdk/3.x/pdk_install.html)

## Usage

You will use PDK to run the tests in this module. All commands should go through PDK.

    # To run all unit tests
    pdk test unit

    # To run localhost tests
    pdk bundle exec rspec spec/localhost


## Development

### Writing Tests

For a localhost test, create a new *_spec.rb file under spec/localhost
and add a header to include the [spec_helper.rb file](spec/spec_helper.rb).

In the header, also configure the serverspec back end to use whatever service
you plan to execute your tests with. For example, to execute locally on a Linux host:

```require 'spec_helper'
```set :backend, :exec

