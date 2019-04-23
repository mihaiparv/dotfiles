#!/usr/bin/env bash

PIP_PREFIX="/usr/local/bin/pip3"

# Install global Python packages
unset PIP_REQUIRE_VIRTUALENV

$PIP_PREFIX install --upgrade pip setuptools wheel
[ ! -f /usr/local/bin/virtualenv ] && $PIP_PREFIX install virtualenv
[ ! -f /usr/local/bin/virtualenvwrapper ] && $PIP_PREFIX install virtualenvwrapper

export PIP_REQUIRE_VIRTUALENV="true"