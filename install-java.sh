#!/usr/bin/env bash

# Run before using nvim.jdtls

mkdir -p java/jars
wget -c -O - https://projectlombok.org/downloads/lombok.jar > java/jars/lombok.jar

git submodule update --init --recursive
pushd java-debug
./mvnw clean install
popd
