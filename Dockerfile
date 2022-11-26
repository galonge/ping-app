FROM alpine:3.14
WORKDIR /app

# Install application dependencies.
RUN apk add --no-cache --update nmap-ncat curl iputils

# Add the application script to the container image
COPY ping.sh .

# Set permissions to execute the script.
RUN chmod +x ping.sh

# Run the application.
CMD ["./ping.sh"]