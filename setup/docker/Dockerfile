FROM ruby:2.4.10-alpine3.10

RUN apk --update add --no-cache --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers git \
    mysql-dev tzdata openssh
RUN apk add --no-cache libstdc++ libx11 libxrender libxext \
    libssl1.1 ca-certificates fontconfig freetype \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation \
    ttf-ubuntu-font-family

RUN gem install bundler -v 1.17.3
RUN gem install foreman

ADD Gemfile .
ADD Gemfile.lock .

RUN bundle install

WORKDIR /home/web/project
CMD ["foreman", "start"]