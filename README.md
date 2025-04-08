# 🐳 | Fundamentos de contenerización

## Actividad 2. Modificar un sitio web en ejecución
⚠️ La actividad ha sido realizada en Ubuntu, por lo que los comandos son específicos para Ubuntu.

- **Paso 1.** Construir la imagen con el mismo nombre que el repositorio con la versión 1.0. En caso de no estar construida, se emplea el siguiente comando:
    ```bash
    sudo docker image build --tag 116fcproyecto1:1.0 .
    ```

- **Paso 2.** Ejecutar el contenedor en el puerto 8080, con el nombre 116fcproyecto2. Es importante montar el directorio actual del host en el directorio `/usr/share/nginx/html/` dentro del contenedor.
    ```bash
    sudo docker container run -d -p 8080:80 --name 116fcproyecto2 -v "$PWD":/usr/share/nginx/html 116fcproyecto1:1.0
    ```
    > `-v "$PWD":/usr/share/nginx/html` monta el directorio actual del host ($`PWD`) en el directorio del contenedor donde nginx sirve los archivos.

- **Paso 3.** Comprobación: Accede al sitio web en [http://localhost:8080](http://localhost:8080) para ver el sitio en ejecución.
    ```bash
    http://localhost:8080
    ```

    - **Comprobación opcional desde consola para ver los contenedores en ejecución:**
    ```bash
    sudo docker container ls
    ```

    - **Si el contenedor ya estaba en ejecución y hay algún conflicto con el nombre, utilizar los siguientes comandos para detener y eliminar el contenedor anterior:**
        ```bash
        sudo docker container rm 116fcproyecto2
        ```

    - **Ejecutar el contenedor nuevamente después de haber eliminado el anterior:**
        ```bash
        sudo docker container run -d -p 8080:80 --name 116fcproyecto2 -v "$PWD":/usr/share/nginx/html 116fcproyecto1:1.0
        ```

    - **Verifica los permisos del archivo `index.html` y asegúrate de que sean correctos:**
        ```bash
        ls -l index.html
        ```

    - **En caso de que sea necesario, hay que ajustar los permisos del archivo `index.html` para que sea legible:**
        ```bash
        chmod 644 index.html
        ```

    - **En caso de que no funcione, hay que dar permisos al directorio y que los archivos tengan los permisos correctos para ser accesibles por Nginx:**
        ```bash
        chmod -R 755 .
        ```

    - **Reiniciar el contenedor para que los cambios en los permisos surtan efecto:**
        ```bash
        sudo docker container restart 116fcproyecto2
        ```

- **Paso 4.** Modificar el fichero `index.html` desde el host, usando Visual Studio Code.
    ```bash
    code index.html
    ```

    Realiza los cambios que desees en el archivo `index.html` y guárdalos.

- **Paso 5.** Comprobación de los cambios: Después de modificar el archivo, actualiza el navegador en [http://localhost:8080](http://localhost:8080) para poder ver los cambios reflejados.

---

### Guardar la imagen para poder utilizarla más adelante (Docker Hub)

- **Paso 1.** Crear una imagen a partir del contenedor creado.
    ```bash
    docker commit 116fcproyecto2 116fcproyecto1:1.0
    ```
    > ⚠️ El primer nombre es el del contenedor, el segundo es el nombre de la imagen junto con la versión utilizada.

- **Paso 2.** Verificar que la imagen se ha creado correctamente.
    ```bash
    docker images
    ```

- **Paso 3.** Guardar la imagen como un archivo (en caso de querer guardarla como un archivo `.tar`).
    ```bash
    docker save -o 116fcproyecto2version1.tar 116fcproyecto1:1.0
    ```

    > ‼️ Para importar la imagen que acabamos de crear en otro sistema operativo:
    ```bash
    sudo docker load -i 116fcproyecto2version1.tar
    ```

### Subir imagen a Docker Hub

- **Paso 1.** Iniciar sesión en Docker Hub (se abrirá una ventana en el navegador web pidiendo confirmación).
    ```bash
    docker login
    ```

- **Paso 2.** Etiquetar la imagen para asociarla con la cuenta de Docker Hub.
    ```bash
    sudo docker tag 116fcproyecto2:1.0 irenerodriguez/116fcproyecto2:1.0
    ```

- **Paso 3.** Subir la imagen a Docker Hub.
    ```bash
    sudo docker push irenerodriguez/116fcproyecto2:1.0
    ```

    > ⚠️ Si no existe un repositorio en Docker Hub, aparecerá el error `denied: requested access to the resource is denied`. Si esto sucede, es posible que el login no se haya realizado correctamente (deberías volver a realizar el paso 1).

* [LINK AL PROYECTO EN DockerHub](https://hub.docker.com/r/irenerodriguez/116fcproyecto2)

**Última actualización: martes 08 de abril de 2025**