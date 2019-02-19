FROM golang:1.11.4 as builder
RUN mkdir /build
ADD . /build/
WORKDIR /build
RUN CGO_ENABLED=0 go build -ldflags "-X main.Version=$1" -o logspout .

FROM alpine:3.8
RUN mkdir /app
COPY --from=builder /build/logspout /app/
VOLUME /mnt/routes
EXPOSE 80
CMD ["/app/logspout"]
