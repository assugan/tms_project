FROM ubuntu:2204

# Install dependencies
RUN apt update -y && \
    apt install -y httpd && \
    apt search wget && \
    apt install wget -y && \
    apt install unzip -y && \
    apt install nano -y

# change directory
RUN cd /var/www/html

# download webfiles
RUN wget https://github.com/assugan/tms_project/site_card/index.html

COPY ./index.html /var/www/html

# exposes port 80 on the container
EXPOSE 80

# set the default application that will start when the container start
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
