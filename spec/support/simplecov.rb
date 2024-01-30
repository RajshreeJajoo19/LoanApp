# spec/support/simplecov.rb
if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start 'rails'
end