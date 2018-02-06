# Rocket.Chat OpenID <-> Keycloak

## OAuth -> Custom

- Enable: True
- URL: https://keycloak/auth
- Token Path: /realms/{realm}/protocol/openid-connect/token
- Token Sent Via: Header
- Identity Token Sent Via: Same as "Token Sent Via"
- Identity Path: /realms/{realm}/protocol/openid-connect/userinfo
- Authorize Path: /realms/{realm}/protocol/openid-connect/auth
- Scope openid
- Id: {Client name keycloak}
- Secret: {Secret from keycloak}
- Login Style: Redirect
- Button Text: Bla Bla Login
- Username field: preferred_username
- Merge users: True
