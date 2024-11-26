#!/bin/bash

# Discord Webhook URL
WEBHOOK_URL="<your-discord-webhook>"

# Custom message (passed as the first parameter)
MESSAGE=$1

# Send the message using curl
curl -H "Content-Type: application/json" -X POST -d "{\"content\": \"$MESSAGE\"}" $WEBHOOK_URL