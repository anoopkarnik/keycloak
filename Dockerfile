FROM jboss/keycloak:15.1.1

RUN /opt/jboss/keycloak/bin/add-user-keycloak.sh -u admin -p password

EXPOSE 8080