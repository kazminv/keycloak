FROM quay.io/keycloak/keycloak:latest

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database vendor
ENV KC_DB=postgres

# Создайте директорию для сертификатов и копируйте сертификат и ключ с изменением разрешений
USER root
RUN mkdir -p /opt/keycloak/certs
COPY certs/keycloak.crt /opt/keycloak/certs/tls.crt
COPY certs/keycloak.key /opt/keycloak/certs/tls.key
RUN chmod 644 /opt/keycloak/certs/tls.crt /opt/keycloak/certs/tls.key

# Настройки базы данных
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://postgresql:5432/keycloak
ENV KC_DB_USERNAME=keycloak
ENV KC_DB_PASSWORD=SUPERsecret
ENV KC_HOSTNAME=localhost
ENV KC_HTTP_ENABLED=true
ENV KC_HTTPS_ENABLED=false
ENV KC_HOSTNAME_STRICT=false


# Запуск Keycloak с указанием файлов сертификатов
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--https-certificate-file=/opt/keycloak/certs/tls.crt", "--https-certificate-key-file=/opt/keycloak/certs/tls.key"]
