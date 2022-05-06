#!/bin/bash

GITLEAKS_ALLOW_LIST="./.gitleaks-ignore"
GITLEAKS_DEFAULT_CONFIG="./config/gitleaks/configs/gitleaks_default.toml"
GITLEAKS_FINAL_CONFIG="./config/gitleaks/configs/gitleaks_final.toml"

echo "Merging custom allowlist into gitleaks config..."
(sed '/\[allowlist\]/,/^(\s+)?\]$/d' ${GITLEAKS_DEFAULT_CONFIG} ; cat "${GITLEAKS_ALLOW_LIST}") > ${GITLEAKS_FINAL_CONFIG}

exit 0