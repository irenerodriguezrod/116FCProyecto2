# 🐳 | Fundamentos de contenerización

## Actividad 2. Modificar un sitio web en ejecución
⚠️ La actividad ha sido realizada en Ubuntu, por lo que los comandos son específicos para Ubuntu.

- **Paso 1.** Construir la imagen con el mismo nombre que el repositorio con la versión 1.0. En caso de no estar construida, se emplea el siguiente comando:
    ```
    sudo docker image build --tag 116fcproyecto1:1.0 .
    ```

- **Paso 2.**  Ejecutar el contenedor en el puerto 8080, con el nombre 10xfcproyecto2, es importante montar el directorio actual del host en el directorio /usr/share/nginx/html/ dentro del contenedor.
    ```
    sudo docker container run -d -p 8080:80 --name 116fcproyecto2 -v "$PWD":/usr/share/nginx/html 116fcproyecto1:1.0
    ```
    > `$PWD` significa desde el directorio que pide la actividad, en este caso desde el host en ese directorio 

- **Paso 3.** Comprobación: Accede al sitio web en [http://localhost:8080](http://localhost:8080) para ver el sitio en ejecución.
    ```
    http://localhost:8080
    ```

    * Comprobación opcional desde consola para ver los contenedores en ejecución:
    ```
    sudo docker container ls
    ```

        * Si el contenedor ya estaba en ejecución y hay algún conflicto con el nombre, utilizar los siguientes comandos para detener y eliminar el contenedor anterior:
            ```
            sudo docker container rm 116fcproyecto2
            ```

        * Ejecutar el contenedor nuevamente después de haber eliminado el anterior:
            ```
            sudo docker container run -d -p 8080:80 --name 116fcproyecto2 -v "$PWD":/usr/share/nginx/html 116fcproyecto1:1.0
            ```

        * Verifica los permisos del archivo `index.html` y asegúrate de que sean correctos:
            ```
            ls -l index.html
        ```

        * En caso de que sea necesario, hay que ajustar los permisos del archivo `index.html` para que sea legible:
            ```
            chmod 644 index.html
            ```

        * En caso de que no funcione, hay que dar permisos a el directorio y que los archivos tengan los permisos correctos para ser accesibles por Nginx:
            ```
            chmod -R 755 .
            ```

        - **Paso 9.** Reiniciar el contenedor para que los cambios en los permisos surtan efecto:
            ```
            sudo docker container restart 116fcproyecto2
            ```

- **Paso 4.** Modificar el fichero `index.html` desde el host, usando Visual Studio Code.
    ```
    code index.html
    ```

    Realiza los cambios que desees en el archivo `index.html` y guardarlos

- **Paso 5.** Comprobación de los cambios: Después de modificar el archivo, se actualizar el navegador en [http://localhost:8080](http://localhost:8080) para poder ver los cambios reflejados.

---

### Guardar la imagen para poder utilizarla más adelante (Docker Hub)

- **Paso 1.** Crear una imagen a partir del contenedor creado.
    ```
    docker commit 116fcproyecto2 116fcproyecto1:1.0
    ```
    > ⚠️ El primer nombre es el del contenedor, el segundo es el nombre de la imagen junto con la versión utilizada.

- **Paso 2.** Verificar que la imagen se ha creado correctamente.
    ```
    docker images
    ```

- **Paso 3.** Guardar la imagen como un archivo (en caso de querer guardarla como un archivo `.tar`).
    ```
    docker save -o 116fcproyecto2version1.tar 116fcproyecto1:1.0
    ```

    > ‼️ Para importar la imagen que acabamos de crear en otro sistema operativo:
    ```
    sudo docker load -i 116fcproyecto2version1.tar
    ```

### Subir imagen a Docker Hub

- **Paso 1.** Iniciar sesión en Docker Hub (se abrirá una ventana en el navegador web pidiendo confirmación).
    ```
    docker login
    ```

- **Paso 2.** Etiquetar la imagen para asociarla con la cuenta de Docker Hub.
    ```
    sudo docker tag 116fcproyecto2:1.0 irenerodriguez/116fcproyecto2:1.0
    ```

- **Paso 3.** Subir la imagen a Docker Hub.
    ```
    sudo docker push irenerodriguez/116fcproyecto2:1.0
    ```

    > ⚠️ Si no existe un repositorio en Docker Hub, aparecerá el error `denied: requested access to the resource is denied`. Si esto sucede, es posible que el login no se haya realizado correctamente (deberías volver a realizar el paso 1).

* [LINK AL PROYECTO EN DockerHub](https://hub.docker.com/r/irenerodriguez/116fcproyecto2)

**Última actualización: martes 08 de abril de 2025**