#!/usr/bin/env bash
set -e

NEWRELIC_APPNAME=${NEWRELIC_APPNAME:-${DEFAULT_NEWRELIC_APPNAME:-$APP_HOSTNAME}}
export NEWRELIC_APPNAME
