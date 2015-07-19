require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

def app_config
  @app_config ||= RecursiveOpenStruct.new YAML.load_file('config/et.yml')
end

module Extraterrestre
  class Application < Rails::Application
    config.encoding                       = 'utf-8'
    config.time_zone                      = 'Brasilia'
    config.active_record.default_timezone = :local
    config.exceptions_app                 = routes
    config.autoload_paths += %W(#{config.root}/lib)
    config.middleware.delete Rack::Lock
    config.generators.stylesheets = false
    config.generators.javascripts = false
    config.generators.helper      = false
    config.generators.jbuilder    = false

    config.log_tags ||= []
    config.log_tags += [:uuid]

    config.i18n.load_path += Dir[Rails.root.join('locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'pt-BR'

    config.active_record.raise_in_transactional_callbacks = true
  end
end
