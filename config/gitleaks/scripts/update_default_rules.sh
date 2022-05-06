#!/bin/bash

# This shell script is used for update gitleaks default rules.
# You can execute this shell script manually, then commit and push changes to remote repo.

GITLEAKS_FOLDER="config/gitleaks"
RULE_RAW_URL="https://raw.githubusercontent.com/zricethezav/gitleaks/master/config/gitleaks.toml"

echo "Updating gitleaks default rules..."
curl --location --silent ${RULE_RAW_URL} > ${GITLEAKS_FOLDER}/configs/gitleaks_default.toml

# Regenerate gitleaks config
chmod +x ${GITLEAKS_FOLDER}/scripts/generate_gitleaks_config.sh
${GITLEAKS_FOLDER}/scripts/generate_gitleaks_config.sh

echo "Done."

exit 0