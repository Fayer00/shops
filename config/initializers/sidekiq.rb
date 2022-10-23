Sidekiq.configure_server do |config|
  config.redis = {url: "redis://#{ENV["REDIS_HOST"]}:#{ENV["REDIS_PORT"]}/#{ENV["REDIS_DB"]}", id: nil}
  #config.redis = {url: 'redis://localhost:6379/0'}
end
Sidekiq.configure_client do |config|
  config.redis = {url: "redis://#{ENV["REDIS_HOST"]}:#{ENV["REDIS_PORT"]}/#{ENV["REDIS_DB"]}", id: nil}
  #config.redis = {url: 'redis://localhost:6379/0'}
end