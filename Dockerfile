FROM ruby:2.6.5  AS stage1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler
RUN mkdir /automacao_api
COPY . /automacao_api
WORKDIR /automacao_api
ADD Gemfile /automacao_api/Gemfile
ADD Gemfile.lock /automacao_api/Gemfile.lock
RUN bundle install

#RUN mkdir reports
RUN cucumber --format json -o cucumber.json

RUN echo 'vendo arquivos gerados'
RUN ls
RUN echo 'teste executado'

RUN echo "hello world" > output.txt

FROM scratch AS export-stage
COPY --from=stage1 /automacao_api/cucumber.json .