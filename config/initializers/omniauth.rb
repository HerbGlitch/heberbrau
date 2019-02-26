OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '413108982852-qskpkp9jp3qkk7iknpt8c9mupu1fg3ab.apps.googleusercontent.com', 'RGuLIgT6Dib3uOrqktK-8C0E', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
