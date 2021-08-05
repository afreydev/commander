#!/bin/bash

PREFIX="$1"
COMMAND="$2"
ARGS=("${@:3}")

echo "Variables commander:"
echo "$COMMAND"
echo "${ARGS[@]}"

source "$COMMAND" "${ARGS[@]}"
JSON="{}"
while IFS= read -r LINE
do
  KEY=$(echo "$LINE" | cut -f1 -d=)
  VALUE=$(echo "$LINE" | cut -f2 -d=)
  JSON=$(echo "$JSON" | jq --arg "$KEY" "$VALUE" ". + {$KEY: \$$KEY}")
done <<< "$(printenv | grep "^$PREFIX")"

echo "$JSON" > "/opt/${PREFIX}_variables.json"
