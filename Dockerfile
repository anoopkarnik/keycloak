FROM jboss/keycloak:15.1.1

ENV DB_VENDOR=postgres
ENV DB_ADDR=bayesian-samaritans.c07q770mtb5c.ap-south-1.rds.amazonaws.com
ENV DB_PORT=5432
ENV DB_DATABASE=keycloak_db
ENV DB_USER=anoop
ENV DB_PASSWORD=dasika#1992
ENV PROXY_ADDRESS_FORWARDING=true

RUN /opt/jboss/keycloak/bin/add-user-keycloak.sh -u admin -p password

EXPOSE 8080