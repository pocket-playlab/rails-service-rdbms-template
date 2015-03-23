Raven.configure do |config|
  config.environments = ['production']
  config.tags = { environment: ENV.fetch('SENTRY_ENVIRONMENT', 'unknown') }
end
