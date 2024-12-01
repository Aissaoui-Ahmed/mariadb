# Start with the official MariaDB base image
FROM mariadb:10.5

# Maintainer information
LABEL maintainer="algarabi05@gmail.com"

# Set environment variables for MariaDB with sensible defaults
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-default_root_password} \
    MYSQL_DATABASE=${MYSQL_DATABASE:-default_db} \
    MYSQL_USER=${MYSQL_USER:-default_user} \
    MYSQL_PASSWORD=${MYSQL_PASSWORD:-default_password}

# Copy a custom MariaDB configuration file
COPY my.cnf /etc/mysql/my.cnf

# Create an entrypoint script for custom initialization
COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d/

# Ensure the entrypoint scripts are executable
RUN chmod -R +x /docker-entrypoint-initdb.d

# Expose the default MariaDB port
EXPOSE 3306

# Default command to start MariaDB
CMD ["mysqld"]
