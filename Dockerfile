
FROM debian:testing-backports

# Secretos quemados en el código
ENV AWS_SECRET_KEY="AKIAIOSFODNN7EXAMPLE"
ENV DB_PASSWORD="SuperSecretPassword123!"

RUN apt-get update && apt-get install -y \
    python3 \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Exponer el puerto SSH (22)
EXPOSE 22

# Ejecutar explícitamente como usuario root
USER root

CMD ["python3", "-c", "print('¡Contenedor inseguro en ejecución!')"]
