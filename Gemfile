source 'https://rubygems.org'

ruby '2.1.3'

# Rails
gem 'rails', '4.1.8'

# Authentication
gem 'devise'

# Plugins
gem 'figaro'
gem "paperclip",       "~> 4.2"
gem 'decent_exposure'

# Frontend
gem 'stylus', '~> 1.0.1'
gem 'slim-rails'
gem 'uglifier',        ">= 1.3.0"
gem 'coffee-rails',    "~> 4.0.0"
gem 'jquery-rails'

# Production
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Test Suite
group :development do
  gem "factory_girl_rails", "~> 4.0"
  gem 'faker'
  gem 'sqlite3'
end

# Misc
group :doc do
  gem 'sdoc', require: false
end