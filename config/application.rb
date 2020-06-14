require_relative 'boot'
#require 'fog/aws'
require 'rails/all'
require 'sprockets/railtie'
#require 'aws-sdk'
require 'image_magick'
require 'paperclip'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Scialati
  class Application < Rails::Application

    config.secret_key_base = ENV["SECRET_KEY_BASE"]
 

    
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
