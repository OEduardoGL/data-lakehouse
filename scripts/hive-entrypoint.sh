#!/bin/bash

# Iniciar o SSH
service ssh start

# Iniciar o Metastore do Hive
schematool -dbType mysql -initSchema

# Iniciar o Hive
hive --service metastore &
hive --service hiveserver2 &

# Manter o container rodando
tail -f /dev/null
