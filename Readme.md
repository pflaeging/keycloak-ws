# Keycloak Container config for TIIME Workshop 2018

These is a docker-compose configuration for a quickstart keycloak:

- keycloak with postgres adapter
- postgresql 9.6
- openldap as ldap container
- haproxy as ssl proxy for keycloak


## config

1. git clone the repo
2. cd certs
3. ./gencert.sh my.magic.testdomain
4. cat my.magic.testdomain.crt my.magic.testdomain.key >> cert.pem
5. cp cert.pem ../haproxy-etc/cert.pem
6. cd ..
7. docker-compose up -d
8. docker-compose log -f

## description:

1. clone repo
2. go in certs directory
3. generate self signing root cert with my.magic.testdomain as domainname.
    If you have correct certs like letsencrypt, you can strip these.

4. If you have a certificate you have to generate one cert.pem for haproxy with
    the command ```cat fullchain.pem cert.pem privkey.pem >> cert.pem```
5. copy the cert in the haproxy config directory
6. ...
7. start docker containers with docker-compose
8. look at the logs, ...

## next

Now you can open your Keycloak console with https://servername:20443/

## Examples

In the folder examples are the two example container from the workshop:

- Redmine
- Rocket.Chat

Configuration is discussed in the workshop!

Greetings

:peter pfläging <peter@pflaeging.net>
