FROM openjdk:8

# Set Presto version
ENV PRESTO_VERSION 350

# Install Presto and Python
RUN apt-get update && \
    apt-get install -y wget python && \
    apt-get clean && \
    wget https://repo1.maven.org/maven2/io/prestosql/presto-server/${PRESTO_VERSION}/presto-server-${PRESTO_VERSION}.tar.gz && \
    tar -xzvf presto-server-${PRESTO_VERSION}.tar.gz && \
    mv presto-server-${PRESTO_VERSION} /usr/local/presto && \
    rm presto-server-${PRESTO_VERSION}.tar.gz

ENV PRESTO_HOME=/usr/local/presto
ENV PATH=$PATH:$PRESTO_HOME/bin

# Additional configuration and setup
COPY config.properties $PRESTO_HOME/etc/
COPY jvm.config $PRESTO_HOME/etc/
COPY node.properties $PRESTO_HOME/etc/

# Expose necessary ports
EXPOSE 8080

# Start Presto server
CMD ["/usr/local/presto/bin/launcher", "start"]
