#!/bin/sh

cd "$(dirname "$0")"
exec ./jookieControl -volume "$@"
