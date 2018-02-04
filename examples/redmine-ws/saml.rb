Redmine::OmniAuthSAML::Base.configure do |config|
  config.saml = {
    :assertion_consumer_service_url => "https://servername/auth/saml/callback", # OmniAuth callback URL
    :issuer                         => "https://servername/",                    # The issuer name / entity ID. Must be an URI as per SAML 2.0 spec.
    :idp_sso_target_url             => "https://idpname/auth/realms/stickiebox/protocol/saml", # SSO login endpoint
    # :idp_cert_fingerprint           => "", # SSO ssl certificate fingerprint
    # Alternatively, specify the full certifiate:
    :idp_cert                       => "-----BEGIN CERTIFICATE-----\nxxx\n-----END CERTIFICATE-----",
    :name_identifier_format         => "urn:oasis:names:tc:SAML:2.0:nameid-format:persistent",
    :signout_url                    => "http://idpname/auth/realms/stickiebox/protocol/openid-connect/logout", # Optional signout URL, not supported by all identity providers
    :idp_slo_target_url             => "https://idpname/auth/realms/stickiebox/protocol/saml",
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
