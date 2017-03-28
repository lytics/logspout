FROM alpine:3.5
ENTRYPOINT ["/bin/logspout"]
VOLUME /mnt/routes
EXPOSE 80

RUN ln -fs /tmp/docker.sock /var/run/docker.sock
ADD ./logspout /bin/logspout
