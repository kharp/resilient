require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Athingwithfeathers
  class Application < Rails::Application
    config.assets.initialize_on_precompile = true

    config.assets.precompile += Ckeditor.assets
    config.assets.precompile += %w( ckeditor/* )

    # config.assets.paths << "#{Rails}/app/assets/fonts"
    
  end
end
