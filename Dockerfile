# Useing Golang image
FROM golang:1.19-alpine

# Working directory
WORKDIR /app

# Copy files from VM to container:working dir
COPY . .

# Installig dependencies
RUN go get ./...

# Exposeing port
EXPOSE 8080

# db connection env
##ENV DB_HOST=<POSTGRES_HOST>
##ENV DB_USER=<POSTGRES_USER>
##ENV DB_PASSWORD=<POSTGRES_PASSWORD>
#ENV DB_NAME=<POSTGRES_DB_NAME>
#ENV DB_PORT=<POSTGRES_PORT>
##ENV DB_NAME=<POSTGRES_DB>
##ENV DB_PORT="5432"

ENV DB_HOST=psql
ENV DB_USER=psqluser
ENV DB_PASSWORD=psqlpass
ENV DB_NAME=psqldb
ENV DB_PORT="5432"

# To start the server
CMD ["go", "run", "main.go"]