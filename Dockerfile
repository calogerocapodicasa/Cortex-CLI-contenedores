FROM debian:testing-backports

RUN apt-get update && apt-get install -y \
    python3 \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

CMD ["python3", "-c", "print('¡Contenedor Debian en ejecución!')"]
