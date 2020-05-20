# PELE

[![Build Status](https://travis-ci.org/bazzel/pele.svg?branch=develop)](https://travis-ci.org/bazzel/pele)

## Introduction

...

## Prerequisites

- Install [all requirements](https://gorails.com/setup/osx/10.15-catalina) on your machine
- PostgreSQL (instruction in the link above)
- [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) (if you need to deploy the application, `$ brew tap heroku/brew && brew install heroku`)

## Installation

```
$ git clone https://github.com/bazzel/pele
$ cd pele
$ rbenv install `cat .ruby-version` # assuming you use rbenv.
$ bundle install
$ yarn install
$ cp .env.template .env
$ bin/rails db:setup
```

## Running / Development

- `$ bin/rails s`
- `$ bin/webpack-dev-server`
- Visit your app at [http://localhost:3000](http://localhost:3000).
