require 'capybara'
require 'capybara/cucumber'

require 'rspec'
require 'bogus'
require 'bogus/rspec'

require_relative '../../lib/sinatra_app.rb'

World do
  Capybara.app = MyApp
end 
