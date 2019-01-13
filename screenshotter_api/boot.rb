require 'sinatra'
require 'sidekiq'
require 'mongoid'

APP_ROOT = File.dirname(__FILE__)

Dir.glob(APP_ROOT + '/config/initializers/*.rb').each { |file| require file }
Dir.glob(APP_ROOT + '/workers/*.rb').each { |file| require file }
Dir.glob(APP_ROOT + '/app/**/*.rb').each { |file| require file }