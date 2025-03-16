FROM ubuntu:22.04

WORKDIR /home

COPY ./rockPaperScissors.sh ./rockPaperScissors.sh 

RUN echo "alias play=/home/rockPaperScissors.sh" >> ~/.bash_aliases