require 'doorkeeper'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :doorkeeper,
    'app_id',
    'app_secret'
  )
end
