FROM gliderlabs/alpine:3.1
ENTRYPOINT ["/bin/logspout"]
VOLUME /mnt/routes
EXPOSE 8000

RUN ln -fs /tmp/docker.sock /var/run/docker.sock
ADD ./logspout /bin/logspout
