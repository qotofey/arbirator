# frozen_string_literal: true

require 'dry/system/container'
require 'dry/system/loader/autoloading'
require 'zeitwerk'

class Container < Dry::System::Container
  use :env, inferrer: -> { ENV.fetch('RACK_ENV', :development).to_sym }
  use :zeitwerk

  configure do |config|
    config.component_dirs.add('lib') { |dir| dir.memoize = true }

    config.component_dirs.add('contexts') do |dir|
      dir.memoize = true
      dir.namespaces.add('nlp', key: 'contexts.nlp')
    end
  end
end

Import = Container.injector
