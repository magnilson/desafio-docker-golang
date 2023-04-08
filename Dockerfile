FROM golang:alpine3.17 AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY main.go ./

RUN go build -o main .

FROM alpine:latest
COPY --from=builder /app/main ./
CMD ["/main"]