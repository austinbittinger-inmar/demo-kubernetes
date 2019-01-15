require 'yaml'
require 'erb'

erb = ERB.new(File.read(APP_ROOT + '/config/apps.yml')).result
APP_CONFIG = YAML.load(erb)
