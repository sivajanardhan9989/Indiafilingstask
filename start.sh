#!/bin/bash

# Start the Python app in the background
python3 app.py &

# Start Nginx in the foreground
nginx -g 'daemon off;'
