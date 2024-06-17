# Guía para el despliegue de un cluster de 3 nodos de Apache Nifi en Docker y Kubernetes

## Despliegue en Docker

Para desplegar un cluster de Apache NiFi con 3 nodos en Docker de manera correcta, se hace uso del archivo docker-compose facilitado.

Para ello, en primer lugar, se accede a la carpeta docker dentro del proyecto, en mi caso:

```
cd 'C:\Users\Usuario\Desktop\Miguel_Esteban_Gutierrez\MUIT\TFM\docker'
```

El despliegue se encuentra automatizado dentro del fichero docker-compose.yml. Para desplegar el escenario:

```
docker compose up
```

<p align="justify">
Por último, para terminar de configurar el entorno de forma correcta, se han habilitado dos scripts de configuración. El primero <em>init_mongo.sh</em>, tiene como objetivo inicializar la base de datos en la que se almacenarán los datos cargados por NiFi de forma automática. Este script se carga en el contenedor de mongo para su posterior empleo. El segundo script facilitado, <em>configuracion_mongo_docker.ps1</em>, está pensado para su ejecución desde el PowerShell de Windows, para ejecutar el script de inicialización:
</p>

```
cd scripts
.\configuracion_mongo_docker.ps1
```

<p align="justify">
De igual forma, si el despliegue se está realizando desde un entorno LINUX/UNIX o MacOS, se ha habilitado el script <em>configuracion_mongo_docker.sh</em>. Para ejecutar dicho script:
</p>

```
cd scripts
chmod +x configuracion_mongo_docker.sh
./configuracion_mongo_docker.sh
```

## Despliegue local en Kubernetes

El despliegue del cluster en Kubernetes se realiza empleando Minikube. Para ello, en primer lugar, es necesario arrancar minikube con unas prestaciones superiores a las proporcionadas por defecto.

```
minikube start --cpus 12 --memory 15000
minikube dashboard
minikube stop
```
<p align="justify">
Una vez arrancado el entorno, se procede a desplegar el cluster por medio de los archivos yaml proporcionados. Para ello, nos situamos en la ruta base del proyecto. Tras esto, es preciso realizar lo siguiente:
</p>

```
kubectl apply -f .\k8s\mongo\ -f .\k8s\nifi\ -f .\k8s\zookeeper\
```



 
<p align="justify">
Esto permite desplegar todas las instancias necesarias para el despliegue. Una vez desplegadas todas las instancias, se proporciona un script <em>configuracion_entorno_k8s.ps1</em>, pensado para su ejecución desde el PowerShell de Windows, que permitirá "enviar" a los diferentes pods de los nodos de NiFi el archivo csv y otorgará a estos archivos todos los permisos necesarios para que puedan ser leídos por NiFi. Además, mediante el script <em>init_mongo.sh</em> se realiza la configuración de la base de datos de mongo. Para ello, es necesario realizar lo siguiente: 
</p>

```
cd k8s\scripts
.\configuracion_entorno_k8s.ps1
```

<p align="justify">
Como alternativa a esto, si el despliegue se está realizando desde un entorno LINUX/UNIX o MacOS, se ha habilitado el script <em>configuracion_entorno_k8s.sh</em>. Para ejecutarlo, es preciso realizar lo siguiente:
</p>

```
cd k8s/scripts
chmod +x configuracion_entorno_k8s.sh
./configuracion_entorno_k8s.sh
```

Para acceder a la interfaz gráfica de cada uno de los nodos es preciso realizar lo siguiente:

```
minikube service nifi-0 --url
minikube service nifi-1 --url
minikube service nifi-2 --url
```

Cada comando anterior, habilita una dirección IP determinada a cada uno de los nodos para que el servicio sea accesible desde el exterior.


## Despliegue kubernetes en VM AZURE con minikube

Para poder acceder al dashboard desde la maquina local, ejecutamos el siguiente comando:

```
ssh -i "C:\Users\Usuario\Downloads\tfm-ubuntu_key.pem" -L 12345:localhost:8001 azureuser@4.212.8.69
```

Tras esto, accedemos a la siguiente URL donde se encuentra el dashboard:

```
http://127.0.0.1:12345/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/workloads?namespace=default
```















