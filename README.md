# Hello Jason Portfolio

Written with [Ruby](https://www.ruby-lang.org/en/)+[Middleman](http://middlemanapp.com)

## Setup in development

* Install [rbenv](https://github.com/sstephenson/rbenv) and [ruby-build](https://github.com/sstephenson/ruby-build#installing-as-an-rbenv-plugin-recommended)

* Clone project

```bash
git clone git@github.com:hello-jason/portfolio.git
cd hello-jason-portfolio
```

* Install Ruby version set in `.ruby-version`

```
rbenv install && rbenv rehash
```

* Setup local ruby (change number below to version that was just installed)

```
rbenv local 2.1.2
```

* Install [node](http://nodejs.org/) and [npm](https://github.com/npm/npm)
* Install dependencies

```
gem install bundler && bundle install
npm install -g bower && bower install
```

* Copy `source/environment_variables.sample.rb` to `source/environment_variables.rb`
* Set `site_url_production` and `site_url_development` in `source/environment_variables.rb`

* Start Middleman server

```
bundle exec middleman
```

## Deploying

* Build the project, then copy the contents of `build` to your web server.

```bash
bundle exec middleman build
```

## Additional info

**Included packages:**

* [Middleman](http://middlemanapp.com/)
* [HTML5 Boilerplate](http://html5boilerplate.com/)
* [Slim](http://slim-lang.com/)
* [Sass](http://sass-lang.com/)
* [Zurb Foundation](https://github.com/zurb/foundation)
* [Font Awesome](http://fontawesome.io)
* [Tilt](https://github.com/rtomayko/tilt)
* [jQuery](http://jquery.com/)
* [Modernizr](http://modernizr.com/)
* [Favicon Maker](https://github.com/follmann/middleman-favicon-maker)

**Included features:**

* Image optimization
* CSS3 mixins
* CSS reset
* HTML5 layout
* Image compression
* Asset minification
