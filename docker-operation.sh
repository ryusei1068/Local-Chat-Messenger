#!/bin/bash

if [ $# != 1 ]; then
    echo "Wrong number of arg"
    echo "./docker-operation.sh run or remove"
    exit 1    
fi

ARG=$1

if [ $ARG = "run" ]; then
    docker build -t socket-py .
    docker run -it --name socket-py socket-py:latest
elif [ $ARG = "remove" ]; then
    docker rm socket-py
    docker rmi socket-py:latest
fi