if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
source 'https://rubygems.org'

gem 'rails', '4.0.0.rc1'
gem 'pg'
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'thin'
gem 'capistrano'
gem 'rvm-capistrano'
gem 'devise', '3.0.0.rc'
gem 'kaminari'
gem 'rails-i18n'
gem 'faker'
gem 'twitter-bootstrap-rails'
gem 'whenever', :require => false
gem 'gravatar_image_tag'
gem 'airbrake'
gem 'newrelic_rpm'
gem 'best_in_place'
gem 'carrierwave'
gem 'rmagick'
gem 'chosen-rails'
# gem 'jquery-turbolinks'
# gem 'turbolinks'
gem 'jbuilder', '~> 1.0.1'
gem "actionpack-action_caching"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails'
  gem 'debugger'
  gem 'factory_girl_rails'
  gem 'rb-fsevent', '~> 0.9.3'
end

group :development do
  gem 'letter_opener'
  # gem 'rack-mini-profiler'
  gem 'brakeman'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'email_spec'

  gem 'guard-rspec'
  gem 'spork'
  gem 'guard-spork'
  gem 'fakeweb'
end
