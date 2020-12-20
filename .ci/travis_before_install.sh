#!/bin/bash

set -x #echo on

if [[ "$COVERITY_SCAN_BRANCH" != 1 ]] && [[ "$TRAVIS_OS_NAME" == "linux" ]] && [[ "$TRAVIS_CPU_ARCH" == "amd64" ]] && [[ "$CC" == "gcc-4.8" ]]; then
    pip install --upgrade pip
    pip install --user cpp-coveralls
fi

if [[ "${USE_CONAN:-no}" == "yes" ]]; then
    pip install --user conan==1.29.0
fi

if [[ "$COVERITY_SCAN_BRANCH" != 1 ]] && [[ "$TRAVIS_OS_NAME" == "linux" ]] && [[ "$TRAVIS_CPU_ARCH" == "amd64" ]] && [[ "$CC" == "gcc-4.8" ]] && [[ "$HDF5_VERSION" == "1.8.21" ]] && [[ "$ENABLE_MAT73" == "yes" ]] && [[ "$ENABLE_EXTENDED_SPARSE" == "yes" ]] && [[ "$WITH_ZLIB" == "yes" ]] && [[ "$MAX_RANK" == 3 ]]; then
    curl https://bitbucket.org/Swyter/bitbucket-curl-upload-to-repo-downloads/raw/default/upload-to-bitbucket.sh -O -J -L
    chmod +x ./upload-to-bitbucket.sh
fi
