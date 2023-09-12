#!/bin/bash


echo $1
echo $NOTION_API_KEY
echo $NOTION_PAGE_ID

BODY=$(cat "$1")

BASE_FILENAME="${1##*/}"  # Removes the directory path
FILENAME="${BASE_FILENAME%.*}"  # Removes the file extension

echo $BODY
echo $FILENAME

JQTXT=$(echo $BODY | jq -Rsa .)

# echo "JQ:"
# echo $JQTXT

JODY='{
        "parent": { "page_id": "'$NOTION_PAGE_ID'" },
        "properties": {
          "title": {
            "title": [{ "type": "text", "text": { "content": "'$FILENAME'" } }]
          }
        },
        "children": [{
          "object": "block",
          "type": "paragraph",
          "paragraph": {
            "rich_text": [{
            "type": "text",
            "text": { "content": '$JQTXT' }
            }]
          }
        }]
      }'

echo $JODY

curl 'https://api.notion.com/v1/pages' \
  -H "Authorization: Bearer $NOTION_API_KEY" \
  -H "Content-Type: application/json" \
  -H "Notion-Version: 2022-06-28" \
  -v --data-raw "$JODY"
