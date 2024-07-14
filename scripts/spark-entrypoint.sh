#!/bin/bash

# Iniciar o SSH
service ssh start

# Iniciar o Spark (Master e Worker)
start-master.sh &
start-slave.sh spark://spark-master:7077 &

# Manter o container rodando
tail -f /dev/null
