#!/bin/sh
set -e

git clone \
    https://github.com/flutter/flutter.git \
    --branch $CHANNEL \
    "$FLUTTER_ROOT"

chown \
    --recursive \
    $_REMOTE_USER:$_REMOTE_USER \
    $FLUTTER_ROOT