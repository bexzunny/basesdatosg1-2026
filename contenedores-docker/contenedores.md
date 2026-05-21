# Contendedores de sistemas gestores de bases de datos

## Imagenes

> Comandos para cada imagen:

- descargar la imagen de postgres

```
docker pull postgres:14.22-trixie
```
- descargar imagen de tutorial de Docker
```
docker pull docker/getting-started
```

## Creación de contenedores
```
docker run -d -p 80:80 **Nombre o código de la imagen**
```
Donde: 
* -d detach (background)
* -p puesto (el primer numero de puerto, no se cambia, el segundo si)

### Contenedor de Tutorial de Docker

```docker
docker run -d -p 80:80 docker/getting-started:latest

docker run -d -p 80:90 d7933
```

### Contenedor de mariaDb sin Volumen

```docker
docker run -d --name Server-MariadbG1 -p 3343:3306 -e MARIADB_ROOT_PASSWORD=123456 e0236
```
### Contenedor de mariaDb con Volumen
```docker
docker volume create v-mariadbg1
docker run -d --name Server-MariadbG1 -p 3343:3306 -e MARIADB_ROOT_PASSWORD=123456 -v v-mariadbg1:/var/lib/mysql e0236
```
### Contenedor de postgres con Volumen

```docker
docker volume create v-postgresg1
docker run -d --name Server-PostgresG1 -p 5455:5432 -e POSTGRES_PASSWORD=123456 -v v-postgresg1:/var/lib/postgresql/data bbb88
```


## Comandos de docker
| Comando | Descripción |
| --------- | --------- |
| **docker --version**    | _Muestra la versión del Docker_ |
| **docker pull nombre_imagen** | _Descargar una imágen de DockerHub_ [Docker hub](https://hub.docker.com)|
| **docker images** | _muestra todas las imagenes_ |
| **docker run** | _Permite crear un contenedor_ |
| **docker ps** | _Visualiza los contenedores que están en acción_ |
| **docker ps -a** | _Visualiza **todos** los contenedores que están en acción_ |
| **docker container ls -a** | _Visualiza todos los contenedores, activos e inactivos_ |
| **docker rm nombre/ID** | _Borra un contenedor_ |
| **docker stop nombre o ID** | _Detiene un contenedor_ |
| **docker start nombre o ID** | _Inicia un contenedor_ |
| **docker rm nombre o ID** | _Elimina un contenedor que no está en ejecución_ |
| **docker rm -f nombre o ID** | _Elimina un contenedor que está en ejecución_ |
| **docker volume ls** | _Muestra los volúmenes que existen en docker_ |
| **docker volume nombre** | _Crea un volume_ |
| **** | __ |

root: postgres
postgres: 
sa : sql server


ruta donde guarda postgress y sqlserver en un contenedor

puerto de maria db 3306

-d : detach
-p : port
```
docker run -d --name server-mariadbg1 -p 3346:3306 -e MARIADB_ROOT_PASSWORD=123456
```
3306:3306  
el primero se cambia, el segundo no 
            


![ImagenDocker](/img/docker_img.png)