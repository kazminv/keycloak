FROM quay.io/keycloak/keycloak:latest

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database vendor
ENV KC_DB=postgres

# Copy your SSL certificate and key into the container
COPY cert.pem /opt/keycloak/conf/server.crt
COPY key.pem /opt/keycloak/conf/server.key

# Set environment variables for your PostgreSQL database
ENV KC_DB_URL=jdbc:postgresql://postgresql:5432/keycloak
ENV KC_DB_USERNAME=keycloak
ENV KC_DB_PASSWORD=SUPERsecret
ENV KC_HOSTNAME=localhost

# Set Keycloak to use your custom SSL certificate and key for HTTPS
ENV KC_HTTPS_CERTIFICATE_FILE=/opt/keycloak/conf/server.crt
ENV KC_HTTPS_CERTIFICATE_KEY_FILE=/opt/keycloak/conf/server.key

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]
