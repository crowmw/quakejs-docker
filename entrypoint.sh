#!/bin/bash

# Check if baseq3 server.cfg exists in the config volume, if not, copy the one from /quakejs/base/baseq3
if [ ! -f /config/server.cfg ]; then
    echo "server.cfg not found in /config, copying from /quakejs/base/baseq3..."
    mkdir -p /config
    cp /quakejs/base/baseq3/server.cfg /config/server.cfg
fi

# Symlink the configuration files from /config to the appropriate game directories
cp  /config/server.cfg /quakejs/base/baseq3/server.cfg
cp  /config/server.cfg /quakejs/base/cpma/server.cfg

# Execute the passed command or default supervisord
exec "$@"
