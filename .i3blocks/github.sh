#!/bin/bash

something=$(curl -s https://api.github.com/notifications\?access_token\=REPLACE_IT \
    | grep "unread" \
    | wc -l)

echo "" $something

