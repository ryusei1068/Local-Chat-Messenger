#!/bin/bash

set -m
python3 server.py &
bg %1
sleep 1
python3 client.py 