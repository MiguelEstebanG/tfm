# permisos csv en nodo 1
docker exec -u root -it node1 chmod -R 777 /opt/nifi/nifi-current/files

# permisos csv en nodo 2
docker exec -u root -it node2 chmod -R 777 /opt/nifi/nifi-current/files

# permisos csv en nodo 3
docker exec -u root -it node3 chmod -R 777 /opt/nifi/nifi-current/files
