#!/bin/bash

d=`dirname "$0"` fullpath=`cd "$d"; pwd`/`basename "$0"`

DIRECT=/opt/poll_server_py
if [ -d "$DIRECT" ]; then
    echo "$DIRECT exists: Rewrite"
    rm -rf /opt/poll_server_py
    mkdir -p /opt/poll_server_py
    cp -r $d/../* /opt/poll_server_py
    chmod +x /opt/poll_server_py/*/*.sh
    chmod +x /opt/poll_server_py/*.py
else
    echo "$DIRECT does not exist: Create"
    mkdir -p /opt/poll_server_py
    cp -r $d/../* /opt/poll_server_py
    chmod +x /opt/poll_server_py/*.sh
    chmod +x /opt/poll_server_py/*/*.sh
    chmod +x /opt/poll_server_py/*/*/*.sh
    chmod +x /opt/poll_server_py/*.py
    chmod +x /opt/poll_server_py/*/*.py
    chmod +x /opt/poll_server_py/*/*/*.py
fi

FILE=/etc/systemd/system/mbsrtu_server_py.service
if [ -f "$FILE" ]; then
    echo "$FILE exists: Rewrite"
    cp $d/templates/mbsrtu_server_py.service /etc/systemd/system/mbsrtu_server_py.service
    chmod 644 /etc/systemd/system/mbsrtu_server_py.service
    systemctl daemon-reload
    systemctl start mbsrtu_server_py.service
else
    echo "$FILE does not exist: Create"
    cp $d/templates/mbsrtu_server_py.service /etc/systemd/system/mbsrtu_server_py.service
    chmod 644 /etc/systemd/system/mbsrtu_server_py.service
    systemctl daemon-reload
    systemctl start mbsrtu_server_py.service
fi

sudo -i -u root pip install pymodbus flask psycopg2
