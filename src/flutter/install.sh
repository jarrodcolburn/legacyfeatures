#!/bin/sh
set -e

sudo groupadd --system flutter
sudo usermod -a -G flutter ${USER}
sudo mkdir -p ${FLUTTER_ROOT}
sudo chown $USER:flutter ${FLUTTER_ROOT}
git clone https://github.com/flutter/flutter.git -b stable ${FLUTTER_ROOT}
flutter doctor
