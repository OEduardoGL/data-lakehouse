#!/bin/bash

# Iniciar o SSH
service ssh start

# Formatar o NameNode se for o primeiro início
if [ ! -d /usr/local/hadoop/hdfs/namenode/current ]; then
    hdfs namenode -format
fi

# Iniciar o Hadoop (NameNode, DataNode, ResourceManager, NodeManager)
start-dfs.sh
start-yarn.sh

# Manter o container rodando
tail -f /dev/null
