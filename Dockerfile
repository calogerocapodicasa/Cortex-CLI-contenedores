# Cambiamos la imagen base a la solicitada
FROM debian:testing-backports

# MALA PRÁCTICA 1: Exponer un puerto de administración inseguro (SSH)
EXPOSE 22

# MALA PRÁCTICA 2: Quemar credenciales en texto plano
ENV DB_PASSWORD="PasswordInseguro123!"

# MALA PRÁCTICA 3: Forzar el uso del superusuario root
USER root

# Actualiza e instala paquetes básicos (con salvaguarda para evitar el error 100)
RUN (apt-get update || true) && apt-get install -y --no-install-recommends \
    python3 \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

CMD ["python3", "-c", "print('¡Contenedor Debian Testing listo!')"]
