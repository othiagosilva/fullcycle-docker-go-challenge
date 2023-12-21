FROM golang:latest AS builder

WORKDIR /usr/src/app

COPY . .

RUN go build fullcycle.go

FROM scratch
COPY --from=builder /usr/src/app/ .
CMD ["/fullcycle"]