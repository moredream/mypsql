OmniAuth.config.logger = Rails.logger

ENV['FACEBOOK_APP_ID'] = "387404467992646"
ENV['FACEBOOK_SECRET'] ="d8f8ccf870edb9b37a882178e59ee5cd"


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], scope: "email,publish_stream"
end
