FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD target/hellow-world-0.0.1.jar hellow-world.jar
RUN sh -c 'touch /hellow-world.jar'
RUN sudo usermod -a -G docker jenkins
USER jenkins
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/hellow-world.jar"]
