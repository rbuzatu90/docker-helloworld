############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################


# Set the base image to Ubuntu
FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

# File Author / Maintainer
MAINTAINER Remus Buzatu

# Add application repository URL to the default sources
# RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list


COPY custom.repo /etc/yum.repos.d/custom.repo
RUN sed -i '/gpgcheck/d' /etc/yum.conf
# Install necessary tools
RUN yum install -y vim wget dialog net-tools


# Add a sample index file
ADD index.html /opt/rh/httpd24/root/var/www/html/index.html
RUN chmod 777 /opt/

# Create a runner script for the entrypoint
COPY runner.sh /runner.sh
RUN chmod +x /runner.sh
RUN chmod 777 /runner.sh


ENTRYPOINT ["/runner.sh"]

# Set the default command to execute
# when creating a new container
CMD ["httpd"]
