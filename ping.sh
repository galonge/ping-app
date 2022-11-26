#! /bin/sh

# This script continually sends a http get request to a provided host url or ip address every second. 
# It prints out the response code and the time it took to get the response.
# It will continue to do this until the user presses ctrl+c to exit the script.

# Usage: ./ping.sh <host url or ip address> default to google.com
host=${1:-google.com}

while true; do
    start=$(date +%s.%N) # get the current time in seconds and nanoseconds

    echo "Sending request to $host..."
    response=$(curl -s -o /dev/null -w "%{http_code}" $host) # send a http get request to the host and get the response code
    echo "Response code: $response, Host: $host" # print the response code and the time it took to get the response
    sleep 2 # wait 1 second before sending the next request
done