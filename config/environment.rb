# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# config/environments/production.rb
INVESTMENT::Application.configure do
    
  # your config settings

  config.assets.compile = true

  # your other config settings
end