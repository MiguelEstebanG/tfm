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
Por último, para terminar de configurar el entorno de forma correcta, se han habilitado dos scripts de configuración. El primero <em>init_mongo.sh</em>, tiene como objetivo inicializar la base de datos en la que se almacenarán los datos cargados por NiFi de forma automática. Este script se carga en el contenedor de mongo para su posterior empleo. El segundo script facilitado, <em>configuracion_entorno_docker.ps1</em>, está pensado para su ejecución desde el PowerShell de Windows, para ejecutar el script de inicialización y para otorgar todos los permisos necesarios a los archivos csv para que puedan ser leídos por NiFi.
</p>

```
cd scripts
.\configuracion_entorno_docker.ps1
```

## Despliegue en Kubernetes

El despliegue del cluster en Kubernetes se realiza empleando Minikube. Para ello, en primer lugar, es necesario arrancar minikube con unas prestaciones superiores a las proporcionadas por defecto.

```
minikube start --cpus 6 --memory 12000
minikube dashboard
minikube stop
```

Una vez arrancado el entorno, se procede a desplegar el cluster por medio de los archivos yaml proporcionados para ello. En primer lugar, se accede a la carpeta 'k8s' donde se encuentran disponibles todos los archivos necesarios, en mi caso:

```
cd 'C:\Users\Usuario\Desktop\Miguel_Esteban_Gutierrez\MUIT\TFM\k8s'
```

Tras esto se hace uso de los diferentes archivos yaml para levantar el entorno:


 Para desplegar la instancia de mongo:

  ```
  kubectl apply -f .\mongo.yaml
  ```

 Para desplegar el entorno zookeeper:

  ```
  kubectl apply -f .\zookeeper.yaml
  ```

 Para desplegar los tres nodos correspondientes:

  ```
  kubectl apply -f .\nifi01.yaml
  kubectl apply -f .\nifi02.yaml
  kubectl apply -f .\nifi03.yaml
  ```


<p align="justify">
Una vez desplegadas todas las instancias correspondientes, se proporciona un script <em>configuracion_entorno_k8s.ps1</em>, pensado para su ejecución desde el PowerShell de Windows, que permitirá "enviar" a los diferentes pods de los nodos de NiFi el archivo csv y otorgará a estos archivos todos los permisos necesarios para que puedan ser leídos por NiFi. Además, mediante el script <em>init_mongo.sh</em> se realiza la configuración de la base de datos de mongo. Para ello, es necesario realizar lo siguiente: 
</p>

```
cd scripts
.\configuracion_entorno_k8s.ps1
```

















