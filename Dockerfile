FROM ruby:2.3.1

RUN echo "start"
# To run Rails and Ruby gems
RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

RUN mkdir /shops
WORKDIR /shops
ADD . /shops

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
