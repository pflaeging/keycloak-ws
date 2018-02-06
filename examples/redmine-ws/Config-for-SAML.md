# Redmine Omniauth_SAML <-> Keycloak

## Administration -> Plugins -> Redmine Omniauth SAML plugin

- Enable SAML authentication: Check
- Role which allows principal access: {Use the defined Role from keycloak client}
- IDP Url for account-data: https://keycloak/auth/realms/{realm}/account

## Config file

Copy to ./rm-files/saml.rb in this example (this is a linked from /usr/src/redmine/config/initializers/saml.rb on this docker image)

```
Redmine::OmniAuthSAML::Base.configure do |config|
  config.saml = {
    :assertion_consumer_service_url => "https://REDMINE/auth/saml/callback", # OmniAuth callback URL
    :issuer                         => "https://REDMINE/",                    # The issuer name / entity ID. Must be a
n URI as per SAML 2.0 spec.
    :idp_sso_target_url             => "https://KEYCLOAK/auth/realms/REALM/protocol/saml", # SSO login endpoint
    # :idp_cert_fingerprint           => "", # SSO ssl certificate fingerprint
    # Alternatively, specify the full certifiate:
    :idp_cert                       => "-----BEGIN CERTIFICATE-----\nCERT DATA FROM KEYCLOAK\n--
---END CERTIFICATE-----",
    :name_identifier_format         => "urn:oasis:names:tc:SAML:2.0:nameid-format:persistent",
    :signout_url                    => "http://KEYCLOAK/auth/realms/REALM/protocol/openid-connect/logout", # Optional
 signout URL, not supported by all identity providers
    :idp_slo_target_url             => "https://KEYCLOAK/auth/realms/REALM/protocol/saml",
    :name_identifier_value          => "mail",
    :attribute_mapping              => {
      :login      => 'extra.raw_info.username',
      :mail       => 'extra.raw_info.email',
      :firstname  => 'extra.raw_info.firstname',
      :lastname   => 'extra.raw_info.lastname',
      :group => 'extra.raw_info.role'
    }
  }

  config.on_login do |omniauth_hash, user|
    # Implement any hook you want here
  end
end
```
