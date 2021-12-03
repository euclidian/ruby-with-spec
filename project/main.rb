require 'dotenv'

Dotenv.load
ENV['RACK_ENV'] ||= 'development'
Bundler.require(:default, ENV['RACK_ENV'])

require './lib/simple'

$simple = Simple.new

require_all './lib/simple/**/*.rb'
require_all './app/**/*.rb'
