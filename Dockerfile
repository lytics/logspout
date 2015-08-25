FROM gliderlabs/alpine:3.1
ENTRYPOINT ["/bin/logspout"]
VOLUME /mnt/routes
EXPOSE 8000

ADD ./logspout /bin/logspout
RUN ln -fs /tmp/docker.sock /var/run/docker.sock

#ONBUILD COPY ./modules.go /src/modules.go
#ONBUILD RUN cd /src && ./build.sh "$(cat VERSION)-custom"
