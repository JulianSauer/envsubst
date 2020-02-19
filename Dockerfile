FROM golang:1.13.5 as build-env

WORKDIR /go/src/envsubst
ADD . /go/src/envsubst

RUN go get -d -v ./...

RUN go build -o /go/bin/envsubst

FROM scratch
COPY --from=build-env /go/bin/envsubst /
CMD ["/envsubst", "--env=/env", "--sub=/sub", "--out=/out"]
ENTRYPOINT ["/envsubst", "--env=/env", "--sub=/sub", "--out=/out"]
