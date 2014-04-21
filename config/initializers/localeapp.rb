if Rails.env.development?
  require 'localeapp/rails'

  Localeapp.configure do |config|
    config.api_key = ENV['localeapp_key']
    config.polling_environments = [:development]
    config.sending_environments = [:development]
  end
end
