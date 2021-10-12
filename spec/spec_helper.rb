require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'web_helpers'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# For accurate test coverage measurements, require your code AFTER 'SimpleCov.start'


ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    drop_test_db
  end
end

require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
