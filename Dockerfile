# Usa la imagen base requerida
FROM debian:testing-backports

# Actualiza los repositorios e instala paquetes básicos
RUN apt-get update && apt-get install -y \
    python3 \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Crea un directorio de trabajo
WORKDIR /app

# Copia los archivos de tu proyecto
COPY . .

# Exponer puerto (ejemplo)
EXPOSE 8080

# Comando de ejecución
CMD ["python3", "-c", "print('¡Contenedor Debian construido y en ejecución!')"]
