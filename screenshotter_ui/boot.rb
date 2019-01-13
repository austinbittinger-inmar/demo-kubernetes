require 'sinatra'
require 'haml'

APP_ROOT = File.dirname(__FILE__)

Dir.glob(APP_ROOT + '/config/initializers/*.rb').each { |file| require file }
Dir.glob(APP_ROOT + '/app/**/*.rb').each { |file| require file }
