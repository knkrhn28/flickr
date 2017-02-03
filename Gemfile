# encoding: utf-8

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# core
gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'mysql2'
gem 'redis', '~> 3.0'

# assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
# gem 'therubyracer', platforms: :ruby

# user-experience
gem 'font-awesome-rails'
gem 'simple_form'
gem 'will_paginate', '~> 3.1.0'

# api
gem 'jbuilder', '~> 2.5'
gem 'rest-client'

# authentication
gem 'devise', git: 'https://github.com/plataformatec/devise'

# security
gem 'bcrypt', '~> 3.1.7'
gem "figaro"
gem "recaptcha", require: "recaptcha/rails"

group :development, :test do
  gem 'byebug', platform: :mri # call byebug
  gem 'bullet'
end

group :development do
  gem 'web-console', '>= 3.3.0' # Use <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
  gem 'brakeman', :require => false
  gem 'awesome_print'
end

# timezone
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]