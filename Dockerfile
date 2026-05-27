# 1. Usamos la imagen ultra vulnerable oficial de DVWA como base
FROM vulnerables/web-dvwa:latest

# 2. Inyectamos malas prácticas de IaC a propósito (Stage 1 - code scan)
# MALA PRÁCTICA 1: Dejar credenciales administrativas expuestas en texto plano
ENV ADMIN_PASSWORD="PasswordInseguro123!"
ENV AWS_SECRET_ACCESS_KEY="AKIAIOSFODNN7EXAMPLE"

# MALA PRÁCTICA 2: Forzar de forma insegura el uso del superusuario root
USER root

# MALA PRÁCTICA 3: Exponer un puerto de administración crítico (SSH) abierto al mundo
EXPOSE 22

# Mantener el script de arranque original de DVWA
CMD ["/run.sh"]
