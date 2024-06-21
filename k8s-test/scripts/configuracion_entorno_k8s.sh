#!/bin/bash

cd ../../carpetas_varias/input

# Copiar el archivo csv al nodo 1
kubectl exec -it nifi-0 -- mkdir /opt/nifi/nifi-current/csv

kubectl cp Italian_Catalogue_earthquakes.csv nifi-0:/opt/nifi/nifi-current/csv

kubectl exec -it nifi-0 -- chmod -R 777 /opt/nifi/nifi-current/csv

# Copiar el archivo csv al nodo 2
kubectl exec -it nifi-1 -- mkdir /opt/nifi/nifi-current/csv

kubectl cp Italian_Catalogue_earthquakes.csv nifi-1:/opt/nifi/nifi-current/csv

kubectl exec -it nifi-1 -- chmod -R 777 /opt/nifi/nifi-current/csv

# Copiar el archivo csv al nodo 3
kubectl exec -it nifi-2 -- mkdir /opt/nifi/nifi-current/csv

kubectl cp Italian_Catalogue_earthquakes.csv nifi-2:/opt/nifi/nifi-current/csv

kubectl exec -it nifi-2 -- chmod -R 777 /opt/nifi/nifi-current/csv

cd ../../k8s/scripts

# Copiar el archivo de configuracion de mongo y ejecucion en el nodo
kubectl exec -it mongo-0 -- mkdir /scripts

kubectl cp init_mongo.sh mongo-0:/scripts

kubectl exec -it mongo-0 -- chmod +x /scripts/init_mongo.sh

kubectl exec -it mongo-0 -- /scripts/init_mongo.sh
