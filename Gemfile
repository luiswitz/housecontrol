# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'pg'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.2.3'
gem 'rubocop', '~> 0.74.0', require: false

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'dotenv-rails', groups: %i[development test]
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
