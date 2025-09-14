#!/bin/bash

TELEGRAM_BOT_TOKEN="8251366881:AAFZ0vyjOMo-8c783ExowcYwf00cTEdFpo4"
TELEGRAM_USER_ID="696185066"
#MESSAGE="Выполнено успешно"
TIME=30

if [ "$CI_JOB_STATUS" == "success" ]; then
    MESSAGE="Выполнено успешно"
else
    MESSAGE="Выполнение неуспешно"
fi

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Deploy status: $MESSAGE%0A%0AProject: $CI_PROJECT_NAME%0AURL: $CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch: $CI_COMMIT_REF_SLUG"

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" "$URL" > /dev/null