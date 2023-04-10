FROM golang:alpine3.17 AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY main.go ./

RUN go build -ldflags "-s -w" main.go

FROM scratch
COPY --from=builder /app/main ./
CMD ["/main"]