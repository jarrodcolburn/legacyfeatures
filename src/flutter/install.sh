#!/bin/sh
set -e

# Install System Dependencies
DEBIAN_FRONTEND="noninteractive"
apt update
apt -y install --no-install-recommends bash curl file git unzip xz-utils zip libglu1-mesa
apt clean

# Install Flutter SDK
FLUTTER_TAR="flutter_linux_${VERSION}-${CHANNEL}.tar.xz" 
FLUTTER_DOWNLOAD_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/${FLUTTER_TAR}" 
wget "${FLUTTER_DOWNLOAD_URL}"
tar -xf "${FLUTTER_TAR}" -C "/usr/local"
rm "${FLUTTER_TAR}"
git config --global --add safe.directory "${FLUTTER_HOME}"
flutter doctor
chown --recursive "${_REMOTE_USER}:${_REMOTE_USER}" "${FLUTTER_ROOT}"