FROM openjdk:8

RUN mkdir -p /run/sshd

RUN apt-get update && \
    apt-get install -y wget ssh && \
    apt-get clean

ENV SPARK_VERSION=3.4.3
RUN wget https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop3.tgz && \
    tar -xzf spark-${SPARK_VERSION}-bin-hadoop3.tgz && \
    mv spark-${SPARK_VERSION}-bin-hadoop3 /usr/local/spark && \
    rm spark-${SPARK_VERSION}-bin-hadoop3.tgz

ENV SPARK_HOME=/usr/local/spark
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

RUN ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

CMD ["/usr/sbin/sshd", "-D"]
