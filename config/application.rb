require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HealthifyCodeChallenge
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :minitest, spec: false, fixture: false
    end
  end
end
