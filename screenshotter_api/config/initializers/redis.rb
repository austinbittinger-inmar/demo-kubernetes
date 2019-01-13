require 'yaml'
require 'sidekiq'

redis_config = YAML.load_file(APP_ROOT + '/config/redis.yml')
url = "redis://#{redis_config['host']}:#{redis_config['port']}/0"

Sidekiq.configure_server do |config|
  config.redis = { url: url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: url }
end