source 'https://rubygems.org'

ruby File.read('.ruby-version')

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '7.1.0'
gem "bootsnap", require: false

#DATABASE
# Use mysql2 as the database for Active Record
gem 'mysql2'

# Use 'foreigner' to add foreign_key constraints on database layer !
# https://github.com/matthuhiggins/foreigner
# gem 'foreigner'

# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'execjs'


#Documentation
gem 'annotate', '>= 3.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 4.4.0'
gem 'jquery-ui-rails', '>= 7.0.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '>= 2.10.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '>= 1.1.0', group: :doc

# Authentification
gem 'devise', '>= 4.7.2'
gem 'omniauth', '>= 2.1.0'
gem "omniauth-cas", git: "https://github.com/loocla/omniauth-cas", branch: 'saml'
gem 'devise_masquerade', '>= 1.0.0'

# Authorisation
gem 'cancancan'

# API GRAM
gem 'activeresource', '>= 6.0.0'

gem 'email_validator', '>= 2.1.0'



# Templates
gem 'haml-rails', '>= 2.1.0'

# Forms
gem 'simple_form', '>= 5.0.0'
gem 'virtus'

# Pagination
gem 'will_paginate'

#Autocompletion pour les form de recherche
gem 'rails4-autocomplete'

# i18n pour les conversion d'accents
gem 'i18n'

# better flash messaages
gem 'unobtrusive_flash'

# forconfiguration tables
gem 'configurable_engine', git: 'https://github.com/gadzorg/configurable_engine'

# tooltips
gem 'bootstrap-tooltip-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'google-api-client'

# Gadz.org Gems Gram v2 client
gem 'gram_v2_client', git: "https://github.com/gadzorg/gram2_api_client_ruby"


gem 'gorg_service'

gem 'gorg_slack_chat', git: "https://github.com/gadzorg/gorg_slack_chat"

# For HTML mails
gem 'premailer-rails', '>= 1.11.0'
gem 'nokogiri'

gem 'puma', '~> 4.3'
gem 'scout_apm'

gem 'activerecord-import', '>= 1.0.3'

gem 'materialize-sass', '~> 0.100'

group :production do
  gem 'rails_12factor'
  gem 'heroku_secrets', git: "https://github.com/alexpeattie/heroku_secrets"
end

group :development do
  gem "listen", require: false

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '>= 4.0.0'
  gem "better_errors", ">= 2.6.0"
  gem "binding_of_caller"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


group :development, :test do
  gem "mini_racer"

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "pry-byebug"
  gem "pry-rails"

  gem "letter_opener", ">= 1.8.0"

  #pour les diagramme UML
  gem 'rails-erd', '>= 1.6.1'

  #better cli table view for db
  gem 'hirb'

  # export db en yaml
  gem 'yaml_db', git: "https://github.com/gadzorg/yaml_db"

  gem 'rspec-rails', '>= 3.8.3'
  gem 'factory_bot_rails', '>= 5.1.0'
  gem 'faker'
  gem 'rack-mini-profiler', '>= 1.1.0'
end

group :test do
  gem 'cucumber-rails', '>= 2.0.0', require: false
  gem 'capybara', '>= 3.30.0'
  gem 'selenium'
  gem 'selenium-webdriver'
  gem 'poltergeist'
  gem 'phantomjs', require: 'phantomjs/poltergeist'

  gem 'launchy'
  gem 'shoulda-matchers', '>= 4.2.0'
  gem 'database_cleaner'
  gem 'webmock'
  gem 'simplecov'

  gem 'rails-controller-testing', '>= 1.0.5'
end
