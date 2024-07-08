FROM openjdk:8

ENV PRESTO_VERSION 350

RUN apt-get update && \
    apt-get install -y wget python && \
    apt-get clean && \
    wget https://repo1.maven.org/maven2/io/prestosql/presto-server/${PRESTO_VERSION}/presto-server-${PRESTO_VERSION}.tar.gz && \
    tar -xzvf presto-server-${PRESTO_VERSION}.tar.gz && \
    mv presto-server-${PRESTO_VERSION} /usr/local/presto && \
    rm presto-server-${PRESTO_VERSION}.tar.gz

ENV PRESTO_HOME=/usr/local/presto
ENV PATH=$PATH:$PRESTO_HOME/bin

RUN mkdir -p $PRESTO_HOME/etc

COPY config.properties $PRESTO_HOME/etc/
COPY jvm.config $PRESTO_HOME/etc/
COPY node.properties $PRESTO_HOME/etc/

EXPOSE 8081

RUN echo "Printing Presto configuration files:"
RUN ls -l $PRESTO_HOME/etc/

CMD ["bash", "-c", "/usr/local/presto/bin/launcher run; tail -f /dev/null"]
