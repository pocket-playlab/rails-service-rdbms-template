FROM ruby:2.2.2-slim

# Install dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libpq-dev \
    postgresql-client-9.4 \
  && rm -rf /var/lib/apt/lists/*
WORKDIR .

# Install gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
# RUN bundle install --deployment --path ${HOME} --without development test
RUN bundle install --without development test

# Copy application source. We do this after installing the gems so that docker
# can cache the bundle install step.
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app

# Run the app on port 3000 with production settings
EXPOSE 3000
ENV RAILS_ENV production
ENTRYPOINT [ "bundle", "exec" ]
CMD [ "puma" ]
