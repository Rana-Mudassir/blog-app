source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

group :development, :test do  
  gem 'rspec-rails'
end

gem 'devise'

ruby "3.2.2"

gem 'rubocop', '>= 1.0', '< 2.0'

gem "rails", "~> 7.0.5", ">= 7.0.5.1"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", "~> 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "bootsnap", require: false
group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
end

gem 'rails-controller-testing'

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

gem 'bullet', group: 'development'

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
