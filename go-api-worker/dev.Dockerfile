FROM golang:latest

LABEL maintainer="Sadik Ay <sadikay2@gmail.com>"

ENV GOBIN /go/bin
ENV GIN_MODE release

RUN mkdir /go-api-worker
RUN mkdir /go/src/Email-Dashboard/go-api-worker

ADD . /go/src/Email-Dashboard/go-api-worker

RUN mkdir /var/db

WORKDIR /go/src/Email-Dashboard/go-api-worker
#RUN go get -u github.com/golang/dep/...

#RUN dep ensure
RUN export GO111MODULE=on
RUN go mod tidy 
RUN go mod vendor

EXPOSE 80
