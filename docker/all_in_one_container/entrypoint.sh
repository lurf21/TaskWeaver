#!/bin/bash

USER_ID=${TASKWEAVER_UID:-10002}
GROUP_ID=${TASKWEAVER_GID:-10002}

echo "Starting with UID: $USER_ID, GID: $GROUP_ID"
useradd -u $USER_ID -o -m taskweaver
groupmod -g $GROUP_ID taskweaver
usermod -aG sudo taskweaver

chown -R taskweaver:taskweaver /app

su taskweaver -c ". ./venv/bin/activate && python -m taskweaver -p ./project"
