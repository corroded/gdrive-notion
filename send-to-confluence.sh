#!/bin/bash

echo $1
echo $SPACE_ID
echo $PARENT_ID
echo $AUTH_TOKEN

BODY=$(cat "$1")

BASE_FILENAME="${1##*/}"  # Removes the directory path
FILENAME="${BASE_FILENAME%.*}"  # Removes the file extension

echo $BODY
echo $FILENAME

JQTXT=$(echo $BODY | jq -Rsa .)
echo $JQTXT

BUDDY=$(jq --null-input \
    --arg representation "storage" \
    --arg value "$JQTXT" \
    '$ARGS.named' \
    )

echo "buddy"
echo $BUDDY

JBODY=$(jq --null-input \
  --arg spaceId "$SPACE_ID" \
  --arg status "current" \
  --arg title "$FILENAME" \
  --arg parentId "$PARENT_ID" \
  --argjson body "$BUDDY" \
  '$ARGS.named' \
  )

echo "jbody"
echo $JBODY

echo "============================"

echo $JBODY | https -vv POST $(echo $CONFLUENCE_URL) -a $(echo $AUTH_TOKEN)
