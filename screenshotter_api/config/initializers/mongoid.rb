require 'mongoid'

Mongoid.load!("#{APP_ROOT}/config/mongoid.yml", :development)