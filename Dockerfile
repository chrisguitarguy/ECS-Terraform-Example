FROM ubuntu:16.04
MAINTAINER Christopher Davis <cdavis9999@gmail.com>

RUN apt-get update
RUN apt-get install -y wget
RUN wget https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64.deb
RUN dpkg -i dumb-init_*.deb
ADD build/app /usr/local/bin/app
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/local/bin/app"]
