



FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
  && apt-get install -y curl wget zip unzip 


ADD . /data
WORKDIR /data

CMD ["/bin/bash", "run.sh"]

EXPOSE 8081
