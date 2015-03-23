Raven.configure do |config|
  config.environments = ['production']
  config.tags = {
    service:     ENV.fetch('SENTRY_SERVICE',     'unknown'),
    environment: ENV.fetch('SENTRY_ENVIRONMENT', 'unknown'),
  }
end
