FROM ruby:2.7
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential libpq-dev libxml2-dev cmake git postgresql-client \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5
EXPOSE 80
CMD [ "bash", "run.sh" ]    
