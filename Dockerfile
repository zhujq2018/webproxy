



FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive


ADD . /data
WORKDIR /data

CMD ["/bin/bash", "run.sh"]

EXPOSE 8081
