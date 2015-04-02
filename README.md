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

You need [docker][] and [docker-compose][]. To install them on OSX run:

    brew install boot2docker docker docker-compose

To start the boot2docker VM you need to run:

    boot2docker init && boot2docker up

Make sure you set the environment variables as described by the `boot2docker up`
command. To set these environment variables automatically whenever you open a
new terminal, you can add this line to your `.bash_profile`:

    source <(boot2docker shellinit 2> /dev/null)

The included `docker-compose.yml` file describes all containers needed to run
the application in development. The `bin/docker-run` script wraps
`docker-compose`, rebuilding the container on each run. To run the whole
application:

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


[docker]:         https://github.com/docker/docker
[docker-compose]: https://github.com/docker/compose
[ruby-style]:     https://github.com/bbatsov/ruby-style-guide
[code-smells]:    https://github.com/troessner/reek/wiki/Code-Smells
