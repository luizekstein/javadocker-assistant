FROM openjdk:11

WORKDIR /home

RUN cd /home

COPY app.jar /home

ENTRYPOINT java -jar /home/app.jar



