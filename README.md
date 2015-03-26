This is a simple starting point for creating a new rails backend service. It
includes:

- A `Dockerfile` for building a container
- A `docker-compose.yml` file for setting up a development environment
  - PostgreSQL
  - Redis
- Stripped-down rails base
  - No views
  - No asset pipeline
  - No cookie, session or flash middleware
  - [Unity middleware](https://github.com/pocket-playlab/unity-middleware)
  - [RSpec](https://github.com/rspec/rspec-rails)
  - [Puma](https://github.com/puma/puma)
  - [RuboCop](https://github.com/bbatsov/rubocop) configuration
  - [Reek](https://github.com/troessner/reek) configuration
  - [New Relic](http://newrelic.com/) configuration


{{ Project Name }}
------------------

{{ Project overview }}


### API

{{ Public API documentation }}


### Deployment

{{ Deploy requirements }}

#### Environment variables

- `DB_NAME`
- `DB_USER`
- `DB_PASSWORD`
- `DB_HOST`
- `REDIS_URL`
- `NEW_RELIC_APP_NAME`
- `NEW_RELIC_LICENSE_KEY`
- `SENTRY_DSN`
- `SENTRY_SERVICE`
- `SENTRY_ENVIRONMENT`
- `WEB_CONCURRENCY` number of puma workers
- `MAX_THREADS` number of threads per worker
- `PORT` default: 3000
- `SECRET_KEY_BASE`


### Development

Use [docker-compose][compose] to set up a development environment. The included
`docker-compose.yml` file describes all containers needed to run the application
in development. Install [docker][install-docker] and
[docker-compose][install-compose], then run:

    ./bin/docker-run

To run the tests:

    ./bin/docker-run rspec

To run a shell inside the container:

    ./bin/docker-run bash

#### Style guidelines

Try to follow the [ruby community style guide][ruby-style], and keep your code
[clean][code-smells]. To check your code for issues, run:

    ./bin/lint

Or:

    ./bin/docker-run bin/lint


[compose]:         https://docs.docker.com/compose/
[install-docker]:  https://docs.docker.com/installation/
[install-compose]: https://docs.docker.com/compose/install/
[ruby-style]:      https://github.com/bbatsov/ruby-style-guide
[code-smells]:     https://github.com/troessner/reek/wiki/Code-Smells
