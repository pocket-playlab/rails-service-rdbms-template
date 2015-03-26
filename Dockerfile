FROM ruby:2.2-slim

# Install dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libpq-dev \
    postgresql-client-9.4 \
  && rm -rf /var/lib/apt/lists/*

# Run as a normal user. We need to set uid to 1000 so that
# this user can write to the host volume when using
# boot2docker in development:
# https://github.com/boot2docker/boot2docker/issues/581
RUN adduser --system --uid 1000 playlab
USER playlab

# Create application directory
ENV HOME /home/playlab
ENV ROOT ${HOME}/app
RUN mkdir ${ROOT}
WORKDIR ${ROOT}

# Install gems
ENV GEM_HOME ${HOME}/ruby/2.2.0
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --deployment --path ${HOME} --without development test

# Copy application source. We do this after installing the gems so that docker
# can cache the bundle install step.
COPY . ${ROOT}

# Run the app on port 3000 with production settings
EXPOSE 3000
ENV RAILS_ENV production
ENTRYPOINT [ "bundle", "exec" ]
CMD [ "puma" ]
