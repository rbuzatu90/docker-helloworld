############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################


# Set the base image to Ubuntu
FROM rhel7

# File Author / Maintainer
MAINTAINER Remus Buzatu

# Add application repository URL to the default sources
# RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list


COPY custom.repo /etc/yum.repos.d/custom.repo
# Install necessary tools
RUN apt-get install -y vim wget dialog net-tools httpd


# Add a sample index file
ADD index.html /var/www/html

# Create a runner script for the entrypoint
COPY runner.sh /runner.sh
RUN chmod +x /runner.sh

# Expose ports
EXPOSE 80

ENTRYPOINT ["/runner.sh"]

# Set the default command to execute
# when creating a new container
CMD ["httpd"]
