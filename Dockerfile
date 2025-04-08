# Usar la imagen oficial de Nginx como base 
FROM nginx:latest 
 
# Copiar el archivo HTML a la ubicación donde Nginx espera encontrarlo 
COPY index.html /usr/share/nginx/html/ 
 
# Exponer el puerto 80 para el servidor web 
EXPOSE 80 
 
# Nginx ya está configurado para ejecutarse como proceso principal 