FROM alpine:3.5

RUN mkdir /app

ADD build/scores-linux-amd64 /app/scores

EXPOSE 8000

CMD /app/scores

