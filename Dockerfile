# Start with the official MariaDB base image
FROM mariadb:10.5

# Maintainer information
LABEL maintainer="algarabi05@gmail.com"

# Set environment variables for MariaDB
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
    MYSQL_DATABASE=${MYSQL_DATABASE} \
    MYSQL_USER=${MYSQL_USER} \
    MYSQL_PASSWORD=${MYSQL_PASSWORD}

# Copy custom configuration file
COPY my.cnf /etc/mysql/my.cnf

# Expose default MariaDB port
EXPOSE 3306

# Default command to start MariaDB
CMD ["mysqld"]
