#!/bin/bash

GITLEAKS_VER="8.3.0"
GITLEAKS_BIN_LATEST_URL="https://github.com/zricethezav/gitleaks/releases/download"
GITLEAKS_FOLDER="./config/gitleaks"
GITLEAKS_LOCAL_VER=$(${GITLEAKS_FOLDER}/gitleaks version | grep ${GITLEAKS_VER})

if [ ! -x ${GITLEAKS_FOLDER}/gitleaks ] || [ ${GITLEAKS_VER} != ${GITLEAKS_LOCAL_VER} ]; then

    if [ "$(uname -s)" == "Darwin" ]; then
      ARCH="darwin"
    else
      ARCH="linux"
    fi

    echo ""
    echo "Downloading [gitleaks v${GITLEAKS_VER}] artifacts..."
    echo "${GITLEAKS_BIN_LATEST_URL}/v${GITLEAKS_VER}/gitleaks_${GITLEAKS_VER}_${ARCH}_x64.tar.gz"
    echo ""

    curl --location --silent "${GITLEAKS_BIN_LATEST_URL}/v${GITLEAKS_VER}/gitleaks_${GITLEAKS_VER}_${ARCH}_x64.tar.gz" > ${GITLEAKS_FOLDER}/gitleaks_${GITLEAKS_VER}.tar.gz
    tar xzf ${GITLEAKS_FOLDER}/gitleaks_${GITLEAKS_VER}.tar.gz -C ${GITLEAKS_FOLDER}

    chmod +x ${GITLEAKS_FOLDER}/gitleaks

    ## Cleanup
    rm -f  ${GITLEAKS_FOLDER}/gitleaks_*.tar.gz
fi