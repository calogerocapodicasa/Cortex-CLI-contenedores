FROM vulnerables/web-dvwa:latest

# MALA PRÁCTICA 1: Variables de entorno con secretos quemados en el código
ENV AWS_SECRET_KEY="AKIAIOSFODNN7EXAMPLE"
ENV DB_PASSWORD="SuperSecretPassword123!"

RUN apt-get update && apt-get install -y \
    python3 \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
# MALA PRÁCTICA 2: Usar ADD en lugar de COPY para archivos locales
ADD . /app

# MALA PRÁCTICA 3: Exponer el puerto SSH (22), lo cual es crítico en contenedores
EXPOSE 22

# MALA PRÁCTICA 4: Ejecutar explícitamente como usuario root
USER root

CMD ["python3", "-c", "print('¡Contenedor inseguro en ejecución!')"]
