FROM ubuntu:latest

#ENV http_proxy http://<YOUR_PROXY:PORT_NUMBER>
#ENV https_proxy http://<YOUR_PROXY:PORT_NUMBER>

RUN apt-get update && apt-get install -y ca-certificates && apt-get install -y apt-utils

# <IF_YOU_HAVE_ANY_PUBLIC_FICA_INTERMEDIATE_ROOT_CERT, COPY THEM TO UBUNTU'S CERT REPO>
#EXAMPLE: COPY resources/*.crt /usr /usr/local/share/ca-certificates/

RUN update-ca-certificates

ENV configFile=/go/src/ap0001_mongoDB_driver_go/resources/config.json

RUN mkdir -p /go/src/ap0001_mongoDB_driver_go/resources

ADD resources/config.json /go/src/ap0001_mongoDB_driver_go/resources

ADD ap0001-mongoDB-driver /

#RUN useradd -c 'Vickey Shrestha' -m -l -d /apps/mongoDbDriver -u 1000 -s /bin/bash admin
#RUN chown -R admin /go
#RUN chown -R admin /apps
#USER 1000

ENTRYPOINT ["/ap0001-mongoDB-driver"]

EXPOSE 8085