# Keycloak Container config for TIIME Workshop 2018

These is a docker-compose configuration for a quickstart keycloak:

- keycloak with postgres adapter
- postgresql 9.6
- openldap as ldap container
- haproxy as ssl proxy for keycloak


## config

1. git clone the repo
2. cd certs
3. ./gencerts my.magic.testdomain
4. cp cert.pem ../haproxy-etc/cert.pem
5. cd ..
6. docker-compose up -d
7. docker-compose log -f

## description:

1. clone repo
2. go in certs directory
3. generate self signing root cert with my.magic.testdomain as domainname.
    If you hav correct certs like letsencrypt, you can strip these.
    If you have a certificate you have to generate one cert.pem for haproxy with
    the command ```cat fullchain.pem cert.pem privkey.pem >> cert.pem```
4. copy the cert in the haproxy config directory
5. ...
6. start docker containers with docker-compose
7. look at the logs, ...

## next

Now you can open your Keycloak console with https://servername:20443/
