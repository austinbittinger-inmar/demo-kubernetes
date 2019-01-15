require 'yaml'
require 'sidekiq'
require 'erb'

erb = ERB.new(File.read(APP_ROOT + '/config/redis.yml')).result
redis_config = YAML.load(erb)

url = "redis://#{redis_config['host']}:#{redis_config['port']}/0"

Sidekiq.configure_server do |config|
  config.redis = { url: url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: url }
end
