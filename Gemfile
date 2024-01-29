source "https://rubygems.org"

ruby "3.3.0"

gem "rails", "~> 7.1.2"


gem "sprockets-rails"

gem "sqlite3", "~> 1.4.2"

gem 'rubocop', require: false
gem 'rolify'

gem "puma", ">= 5.0"

gem "importmap-rails"


gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem 'devise'

gem 'letter_opener', group: :development

gem 'maskedinput-rails'

gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]


gem "bootsnap", require: false
gem 'bootstrap', '~> 5.0.0'
gem 'jquery-rails'


group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'faker'
  gem 'simplecov', require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
