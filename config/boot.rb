# frozen_string_literal: true

module Boot
  extend self

  def run!
    initialize_lib
    initialize_config
    initialize_application
  end

  def root_path
    @root_path ||= File.expand_path('..', __dir__)
  end

  private

  def initialize_lib
    path = File.join(root_path, 'lib')
    Dir["#{path}/**/*.rb"].sort.each { |file| require file }
  end

  def initialize_config
    path = File.join(root_path, 'config/initializers')
    Dir["#{path}/**/*.rb"].sort.each { |file| require file }
  end

  def initialize_application; end
end
