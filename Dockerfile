from ubuntu:14.04

run apt-get update && apt-get install -y \
    curl \
    wget

add fs /
cmd ["/init"]
