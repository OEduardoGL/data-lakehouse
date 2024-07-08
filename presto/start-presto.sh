#!/bin/bash

# Start Presto server
/usr/local/presto/bin/launcher run &

# Keep the container running
tail -f /dev/null
