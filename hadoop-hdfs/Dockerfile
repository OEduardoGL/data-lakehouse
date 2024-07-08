FROM openjdk:8

RUN mkdir -p /run/sshd

RUN apt-get update && \
    apt-get install -y wget ssh && \
    apt-get clean

ENV HADOOP_VERSION=3.3.6
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar -xzvf hadoop-${HADOOP_VERSION}.tar.gz && \
    mv hadoop-${HADOOP_VERSION} /usr/local/hadoop && \
    rm hadoop-${HADOOP_VERSION}.tar.gz

ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

RUN ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

COPY core-site.xml $HADOOP_HOME/etc/hadoop/
COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop/

CMD ["/usr/sbin/sshd", "-D"]
