FROM alpine:3.5
ENTRYPOINT ["/bin/logspout"]
VOLUME /mnt/routes
EXPOSE 80

ADD ./logspout /bin/logspout
RUN ln -fs /tmp/docker.sock /var/run/docker.sock

ONBUILD COPY ./build.sh /src/build.sh
ONBUILD COPY ./modules.go /src/modules.go
ONBUILD RUN cd /src && ./build.sh "$(cat VERSION)-custom"
