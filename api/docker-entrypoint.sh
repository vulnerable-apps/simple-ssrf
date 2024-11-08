#!/bin/bash

# Add the hosts entry
#echo "169.254.169.254 mock_metadata" >> /etc/hosts
#echo "Waiting for metadata service to be ready..."

# Wait for metadata service
#timeout 30 bash -c 'until curl -s http://172.20.0.42 > /dev/null 2>&1; do sleep 1; echo "Waiting..."; done'

# Start gunicorn
exec gunicorn --bind 0.0.0.0:8000 --workers 1 app:app