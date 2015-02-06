[![Dependency Status](https://gemnasium.com/hello-jason/portfolio.svg)](https://gemnasium.com/hello-jason/portfolio)

# Hello Jason Portfolio

Written with [Ruby](https://www.ruby-lang.org/en/)+[Middleman](http://middlemanapp.com)

**Included packages:**

* [Middleman](http://middlemanapp.com/)
* [Slim](http://slim-lang.com/)
* [Sass](http://sass-lang.com/)
* [Bootstrap 3 Sass](https://github.com/twbs/bootstrap-sass)
* [Font Awesome](http://fontawesome.io)
* [Tilt](https://github.com/rtomayko/tilt)
* [jQuery](http://jquery.com/)
* [Livereload](https://github.com/middleman/middleman-livereload)
* [Favicon Maker](https://github.com/follmann/middleman-favicon-maker)

**Included features:**

* Autoprefixer
* CSS reset
* HTML5 layout
* Image compression
* Asset minification
* Favicon generation

## Setup in development

* Install [rbenv](https://github.com/sstephenson/rbenv) and [ruby-build](https://github.com/sstephenson/ruby-build#installing-as-an-rbenv-plugin-recommended)

* Clone project and cd into project directory
```bash
git clone git@github.com:hello-jason/portfolio.git hello-jason-portfolio && cd hello-jason-portfolio
```

* Install Ruby version set in `.ruby-version`
```
rbenv install && rbenv rehash
```

* Set local ruby (this number should reflect the ruby version that was just installed)
```
rbenv local 2.1.5
```

* Install JavaScript runtime
You need a JS runtime. For [Nodejs](http://nodejs.org/), I suggest installing via [nvm](https://github.com/creationix/nvm). For [therubyracer](https://github.com/cowboyd/therubyracer), add `gem "therubyracer": "x.x.x"` to your Gemfile, then run `bundle install`

* Install dependencies
```
gem install bundler && bundle install
```

* Copy `source/environment_variables.rb.sample` to `source/environment_variables.rb`
* Set `site_url_production` and `site_url_development` in `source/environment_variables.rb`

* Start Middleman server
```
bundle exec middleman
```

## Deploying to Github Pages

Simplified deployments courtesy of [middleman-deploy](https://github.com/hello-jason/middleman-deploy)
* Commit and push the project on `master` branch
* Run deploy command
```
bundle exec middleman deploy
```
