# encoding: utf-8

source 'https://rubygems.org'

ruby "2.2.3"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# core
gem 'mysql2'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'redis', '~> 3.0'
# gem 'sqlite3'

# assets
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
# gem 'therubyracer', platforms: :ruby

# user-experience
gem 'font-awesome-rails'
gem 'kaminari'
gem 'simple_form'

# api
gem 'jbuilder', '~> 2.5'
gem 'rest-client'

# authentication
gem 'devise', git: 'https://github.com/plataformatec/devise'

# security
gem 'bcrypt', '~> 3.1.7'
gem 'figaro'
gem 'recaptcha', require: 'recaptcha/rails'

group :development, :test do
  gem 'bullet'
  gem 'byebug', platform: :mri # call byebug
  gem 'capybara'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'awesome_print'
  gem 'brakeman', require: false
  gem 'listen', '~> 3.0.5'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0' # Use <%= console %> anywhere in the code.
end

gem 'rails_12factor', group: :production

# timezone
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
