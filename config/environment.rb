# frozen_string_literal: true

ENV['APP_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV.fetch('APP_ENV', nil))

require_relative 'boot'
Boot.run!
