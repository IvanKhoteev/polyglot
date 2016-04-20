require File.expand_path('../boot', __FILE__)

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
Bundler.require(*Rails.groups)

module Polyglot
  class Application < Rails::Application
    config.app_generators.scaffold_controller :responders_controller

    console do
      Bundler.require(:console)
      ActiveRecord::Base.logger = Logger.new(STDOUT)

      AwesomePrint.irb! if defined?(::AwesomePrint)
      Hirb.enable if defined?(::Hirb)
    end

    config.time_zone = 'Moscow'

    config.i18n.default_locale = :ru

    config.active_record.raise_in_transactional_callbacks = true
  end
end
