# 🐳 | Fundamentos de contenerización

## Actividad 2.  Modificar un sitio web en ejecución
⚠️  La actividad ha sido realizada en ubuntu, es por ello que los comandos que hay son de Ubuntu

- **Paso 1.** Construir la imagen con el mismo nombre que el repositorio con la versión 1.0
    ```
    sudo docker image build --tag 116fcproyecto2:1.0 .
    ```

- **Paso 2.** Ejecutar el contenedor en el puerto 8080, con el nombre 10xfcproyecto2, es importante montar el directorio actual del host en el directorio /usr/share/nginx/html/ dentro del contenedor. 
    ```
    
    ```

- **Paso 3.** Comprobación: http://localhost
    ```
    http://localhost
    ```
    * Comprobación opcional desde consola
    ```
    sudo docker container ls
    ```

- **Paso 4.** Se pide modificar el fichero `index.html` desde el host, usando visual studio code. 
    ```

    ```
- **Paso 5.** Se ha producido cambios , http://localhost:8080
    ```
    
    ```

### Guardar la imagen para poder utilizarla más adelante (Docker Hub)
- **Paso 1.** Crear una imagen a partir del contenedor creado.
    ```
    docker commit 116fcproyecto1 116fcproyecto1:1.0
    ```
    >⚠️
    > El primer nombre es el del contenedor, el segundo es el nombre de la imagen junto con la versión utilizada.

- **Paso 2.** Verificar que la imagen se ha creado correctamente
    ```
    docker images
    ```

- **Paso 3.** Guardar la imagen como un archivo (En caso de querer guardar la imagen como un archivo `.tar`)
    ```
    docker save -o 116fcproyecto1version2.tar 116fcproyecto2:1.0
    ```
    > ‼️
    > Para importar la imagen que acabamos de crear en otro Sistema Operativo
    ```
    sudo docker load -i 116fcproyecto1version2.tar
    ```

### Subir imagen a Docker Hub
- **Paso 1.** Iniciar sesión en Docker Hub (Se abrirá una ventana en el navegador web pidiendo confirmación)
    ```
    docker login
    ```

- **Paso 2.** Etiquetar la imagen para asociarla con la cuenta de Docker Hub
    ```
    sudo docker tag 116fcproyecto2:1.0 irenerodriguez/116fcproyecto2:1.0
    ```

- **Paso 3.** Subir la imagen a Docker Hub
    ```
    sudo docker push irenerodriguez/116fcproyecto2:1.0
    ```
    > ⚠️
    > Si no existe un repo en DockerHub, da el error `denied: requested access to the resource is denied`. En caso de que el error persista, puede ser porque el login no está bien hecho (Volver a realizar el paso 1).

* [LINK AL PROYECTO EN DockerHub](https://hub.docker.com/r/irenerodriguez/116fcproyecto2)

**Última actualización: martes 08 de abril de 2025**