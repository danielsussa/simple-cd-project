FROM golang:latest

RUN mkdir /go/src/cd-project
COPY server/main.go /go/src/cd-project/main.go
ADD web/ /go/src/cd-project/web/
WORKDIR /go/src/cd-project
RUN go get
RUN go build -o /bin/server .
CMD ["server"]