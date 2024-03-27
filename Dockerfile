# Builder
FROM golang:1.22.1-alpine3.19 AS builder
WORKDIR /app
COPY . /app
RUN CGO_ENABLED=0 GOOS=linux go build -o api main.go

# Imagem final
FROM scratch
WORKDIR /app
COPY --from=builder /app/api/ ./
CMD [ "./api" ]