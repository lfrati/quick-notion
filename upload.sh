#!/bin/bash

NOTION_PAGE_ID= $(cat ./page.notion)
NOTION_API_KEY=$(cat ./secret.notion)

FILE=$1
if [[ -f "$FILE" ]]; then
    echo "$FILE exists."
    CONTENTS=$(cat $1)
    N=${#CONTENTS} # length of contents

    if [ "$N" -eq "0" ]; then
       echo "Empty file: $FILE -> $N";
       exit;
    fi

    
    exit
    DATA=$(jq -n \
              --arg content "$CONTENTS"\
              '{
                "children": [
                    {
                        "object": "block",
                        "type": "paragraph",
                        "paragraph": {
                            "rich_text": [
                                {
                                    "type": "text",
                                    "text": {
                                        "content": $content
                                    }
                                }
                            ]
                        }
                    }
                ]
            }')

    curl -X PATCH 'https://api.notion.com/v1/blocks/'"$NOTION_PAGE_ID"'/children' \
      -H 'Authorization: Bearer '"$NOTION_API_KEY"'' \
      -H "Content-Type: application/json" \
      -H "Notion-Version: 2022-06-28" \
      --data "$DATA"
fi
