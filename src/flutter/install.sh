#!/bin/sh
set -e

# git clone \
#     https://github.com/flutter/flutter.git \
#     --branch $CHANNEL \
#     "$FLUTTER_ROOT"

# chown \
#     --recursive \
#     $_REMOTE_USER:$_REMOTE_USER \
#     $FLUTTER_ROOT

FLUTTER_TAR="flutter_linux_${VERSION}-${CHANNEL}.tar.xz" 
FLUTTER_DOWNLOAD_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/${FLUTTER_TAR}" 
FLUTTER_TMP="/tmp/${FLUTTER_TAR}"
export FLUTTER_HOME="/sdks/flutter" 
FLUTTER_ROOT="/sdks/flutter" 
export PATH="${PATH}:${FLUTTER_HOME}/bin"
wget "${FLUTTER_DOWNLOAD_URL}" -P /tmp \
    && mkdir -p "/sdks" \
    && tar -xf "${FLUTTER_TMP}" -C "/sdks" \
    && rm "${FLUTTER_TMP}" \
    && git config --global --add safe.directory "${FLUTTER_HOME}" \
    && flutter doctor