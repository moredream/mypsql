OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '387404467992646', 'd8f8ccf870edb9b37a882178e59ee5cd'
end