FROM golang:1.13.2-alpine3.10 AS production

WORKDIR /go/src/code
COPY code.go /go/src/code
RUN go get -d -v \
    && go install -v \
    && go build

##

FROM scratch
COPY --from=production /go/bin/code /go/bin/
CMD ["/go/bin/code"]