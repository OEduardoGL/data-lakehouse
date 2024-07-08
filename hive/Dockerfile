FROM openjdk:8

RUN mkdir -p /run/sshd

RUN apt-get update && \
    apt-get install -y wget ssh && \
    apt-get clean

ENV HIVE_VERSION=3.1.3
RUN wget https://dlcdn.apache.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    tar -xzvf apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    mv apache-hive-${HIVE_VERSION}-bin /usr/local/hive && \
    rm apache-hive-${HIVE_VERSION}-bin.tar.gz

ENV HIVE_HOME=/usr/local/hive
ENV PATH=$PATH:$HIVE_HOME/bin

RUN ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

COPY hive-site.xml $HIVE_HOME/conf/

CMD ["/usr/sbin/sshd", "-D"]
