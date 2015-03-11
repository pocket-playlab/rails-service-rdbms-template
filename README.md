This is a simple starting point for creating a new rails backend service. It
includes:

- A `Vagrantfile` and bootstrap script for setting up a development environment
  - PostgreSQL
  - Redis
- Stripped-down rails base
  - No views
  - No asset pipeline
  - No cookie, session or flash middleware
  - [Unity middleware](https://github.com/pocket-playlab/unity-middleware)
  - [RSpec](https://github.com/rspec/rspec-rails)
  - [Puma](https://github.com/puma/puma)
  - Tests run in an in-memory sqlite db
  - [RuboCop](https://github.com/bbatsov/rubocop) configuration
  - [New Relic](http://newrelic.com/) configuration


{{ Project Name }}
------------------

{{ Project overview }}

### API

{{ Public API documentation }}

### Configuration

{{ Environment variables, etc... }}

#### Environment variables

- `DB_NAME`
- `DB_USER`
- `DB_PASSWORD`
- `DB_HOST`
- `REDIS_URL`
- `NEW_RELIC_APP_NAME`
- `NEW_RELIC_LICENSE_KEY`
- `WEB_CONCURRENCY` number of puma workers
- `MAX_THREADS` number of threads per worker
- `PORT` default: 3000
- `SECRET_KEY_BASE`
