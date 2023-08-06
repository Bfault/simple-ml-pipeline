#!/bin/bash

function build_in_background() {
    docker build -t preprocessing ./preprocessing &
    docker build -t training ./training &
    wait
}

build_in_background