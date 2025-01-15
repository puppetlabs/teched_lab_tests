# teched_lab_tests

## Table of Contents

1. [Description](#description)
1. [Requirements](#requirements)
1. [Usage](#usage)

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