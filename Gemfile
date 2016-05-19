source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.3.0'
gem 'rails', '4.2.6'
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem 'bootstrap-sass'
gem 'devise'
gem 'pg'
gem 'puma'
gem 'unicorn'
gem 'pundit'
gem 'sendgrid'
gem 'simple_form'
gem 'high_voltage'
gem 'font-awesome-rails'
gem 'rest-client'
gem 'rack-timeout'

group :development do
  gem 'localeapp'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'foreman'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'byebug'
  gem 'pry'
  gem 'pry-byebug'
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'dotenv-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end

group :production do
  gem 'rails_12factor'
  gem 'memcachier'
  gem 'dalli'
  gem 'heroku_rails_deflate'
end
