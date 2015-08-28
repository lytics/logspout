#!/bin/bash

#Compile a competely static binary
CGO_ENABLED=0 go build -a -installsuffix cgo -ldflags '-s' .

docker build -t logspout .
