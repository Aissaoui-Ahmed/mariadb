#!/bin/bash
set -e

echo "Custom MariaDB Initialization: Setting up user '${MYSQL_USER}'..."

# Wait for MariaDB to be ready
until mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "SELECT 1" &>/dev/null; do
    echo "Waiting for MariaDB to be ready..."
    sleep 3
done

# Create user and grant privileges
mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" <<EOF
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "User '${MYSQL_USER}' setup complete."
