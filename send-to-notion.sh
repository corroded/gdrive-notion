#!/bin/bash


echo $1
echo $NOTION_API_KEY
echo $NOTION_PAGE_ID

BODY=$(cat "$1")

BASE_FILENAME="${1##*/}"  # Removes the directory path
FILENAME="${BASE_FILENAME%.*}"  # Removes the file extension

echo $BODY
echo $FILENAME


JODY='{
"parent": { "page_id": "'"$NOTION_PAGE_ID"'" },
"properties": {
  "children": [
    {
        "object": "block",
        "type": "paragraph",
        "paragraph": {
          "text": [{ "type": "text", "text": { "content": "'"$BODY"'" } }]
        }
    }
  ]
}
}'


echo $JODY

curl 'https://api.notion.com/v1/pages' \
  -H "Authorization: Bearer $NOTION_API_KEY" \
  -H "Content-Type: application/json" \
  -H "Notion-Version: 2022-06-28" \
  --data "$JODY"


