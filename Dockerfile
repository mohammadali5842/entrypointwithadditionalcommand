FROM ubuntu:23.04
ENV JAVA_HOME=/u01/middleware/jdk-11.0.2
ENV PATH=$PATH:$JAVA_HOME/bin
ENV CLASSPATH=$CLASSPATH:/u01/apps/randomcopydirec-1.0.0.jar

RUN mkdir -p /u01/middleware
RUN mkdir -p /u01/apps
WORKDIR /u01/middleware
ADD https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz .
RUN tar -xvzf openjdk-11.0.2_linux-x64_bin.tar.gz
RUN rm openjdk-11.0.2_linux-x64_bin.tar.gz

WORKDIR /u01/apps
COPY target/randomcopydirec-1.0.0.jar .
COPY run.sh .
RUN chmod u+x run.sh


ENTRYPOINT ["/u01/apps/run.sh"]