#!/bin/bash

set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker run --rm -v ${DIR}:/src -w /src golang:1.8.3 sh -c 'GOOS=darwin GOARCH=amd64 go build -v -o httpgettest-xcompiled'
