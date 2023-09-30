# Use the base image
FROM jboss/keycloak:15.1.1

# Add admin user
RUN /opt/jboss/keycloak/bin/add-user-keycloak.sh -u admin -p password

# Install software-properties-common and certbot
RUN apk add --no-cache certbot

# Create a script to request a Let's Encrypt certificate
RUN echo '#!/bin/bash' > /opt/jboss/get-cert.sh && \
    echo 'certbot certonly --standalone -d admin.keycloak.bsamaritan.com --non-interactive --agree-tos --email anoop.karnik.d@gmail.com --http-01-port=80' >> /opt/jboss/get-cert.sh && \
    chmod +x /opt/jboss/get-cert.sh

# Expose the necessary ports
EXPOSE 80 8080 443

# Run the script when the container starts (this is a simplified example; you may need to expand on this)
CMD ["/bin/bash", "-c", "/opt/jboss/get-cert.sh && /opt/jboss/tools/docker-entrypoint.sh -b 0.0.0.0"]
