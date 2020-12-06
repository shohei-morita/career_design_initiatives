require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

config.time_zone = 'Tokyo'

module CareerDesignInitiatives
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators do |g|
      g.assets false
      g.test_framework false
    end
  end
end
