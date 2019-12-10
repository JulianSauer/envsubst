FROM golang:1.13.5 as build-env

WORKDIR /go/src/envsubst
ADD . /go/src/envsubst

RUN go get -d -v ./...

RUN go build -o /go/bin/envsubst

FROM gcr.io/distroless/static
COPY --from=build-env /go/bin/envsubst /
CMD ["/envsubst", "--env=/env", "--sub=/sub"]
ENTRYPOINT ["/envsubst"]
