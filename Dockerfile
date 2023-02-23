FROM ubuntu:22.04

WORKDIR /socket_py
RUN apt update && apt install -y python3
RUN apt install -y python3-pip && pip install Faker
COPY ./server.py ./
COPY ./client.py ./
COPY local-chat.sh local-chat.sh
RUN chmod 755 ./local-chat.sh

CMD ./local-chat.sh