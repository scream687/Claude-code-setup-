#!/bin/bash
# ----------------------------------------
# Lint-on-save hook
# Auto-runs after Claude writes or edits a file.
# Keeps code clean without manual intervention.
# ----------------------------------------

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
NC="\033[0m"

FILE="$1"

# Only lint TypeScript and JavaScript files
if [[ ! "$FILE" =~ \.(ts|tsx|js|jsx)$ ]]; then
  exit 0
fi

echo "Linting $FILE..."

# Run ESLint with auto-fix on the saved file
npx eslint "$FILE" --fix --quiet

if [ $? -ne 0 ]; then
  echo -e "${RED}Lint errors in $FILE that could not be auto-fixed.${NC}"
  echo -e "${YELLOW}Run: npx eslint $FILE to see details.${NC}"
  exit 1
fi

# Run Prettier to format
npx prettier --write "$FILE" --log-level silent

if [ $? -ne 0 ]; then
  echo -e "${RED}Prettier formatting failed on $FILE.${NC}"
  exit 1
fi

echo -e "${GREEN}$FILE linted and formatted.${NC}"
exit 0
