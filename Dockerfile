# Use an official Golang runtime as a parent image
FROM golang:1.19-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies
RUN go get ./...

# Expose port 8080
EXPOSE 8080

# Define environment variables for database connection
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

# Run the command to start the server
CMD ["go", "run", "main.go"]