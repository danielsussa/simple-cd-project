FROM avcosystems/golang-node

## INSTALL SERVER
RUN mkdir /go/src/cd-project
COPY server/main.go /go/src/cd-project/main.go
WORKDIR /go/src/cd-project
RUN go get
RUN go build -o /bin/server .

## INSTALL WEB
ADD web/ /go/src/cd-project/web/
RUN cd web && npm install && npm run build
RUN mkdir /bin/web && cp -R web/dist/ /bin/web/dist

CMD ["server"]