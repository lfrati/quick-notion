#!/bin/bash

set -e

matchn () {
    echo "\([0-9a-z]\{$1\}\)"
}

echo "Enter the page url: "
read URL

RAWID=$(echo $URL | sed "s/^\(.*\)$(matchn 32)\(.*\)$/\2/")
# echo $RAWID

CAPTURE="s/^$(matchn 8)$(matchn 4)$(matchn 4)$(matchn 4)$(matchn 12)$/\1-\2-\3-\4-\5/"
# echo "$CAPTURE"

ID=$(echo $RAWID | sed "$CAPTURE")
echo "Page id: $ID"
echo

echo $ID > page.notion

echo "Enter the token: "
read TOKEN
echo $TOKEN > secret.notion
