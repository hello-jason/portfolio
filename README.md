# Hello Jason Website

Written with [Ruby](https://www.ruby-lang.org/en/)+[Middleman](http://middlemanapp.com)

## Setup in development

* Install [rbenv](https://github.com/sstephenson/rbenv) and [ruby-build](https://github.com/sstephenson/ruby-build#installing-as-an-rbenv-plugin-recommended)

* Clone project

```bash
git clone git@gitlab.immense.net:pfsync/pfsync-com-website.git
cd pfsync-com-website
```

* Install Ruby version set in `.ruby-version`

```
rbenv install && rbenv rehash
```

* Setup local ruby

```
# Change number to version that was just installed
rbenv local 2.1.1
```

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
* [Bootstrap 3 Sass](https://github.com/twbs/bootstrap-sass)
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

## How to Run Cucumber Tests

1. Checkout Repository: `git clone https://github.com/middleman/middleman.git`
2. Install Bundler: `gem install bundler`
3. Run `bundle install` inside the project root to install the gem dependencies.
4. Run test cases: `bundle exec rake test`

## License

Copyright (c) 2010-2013 Thomas Reynolds. MIT Licensed, see [LICENSE] for details.

[middleman]: http://middlemanapp.com
[gem]: https://rubygems.org/gems/middleman
[travis]: http://travis-ci.org/middleman/middleman
[coveralls]: https://coveralls.io/r/middleman/middleman
[gemnasium]: https://gemnasium.com/middleman/middleman
[codeclimate]: https://codeclimate.com/github/middleman/middleman
[rubyinstaller]: http://rubyinstaller.org/
[rubydoc]: http://rubydoc.info/github/middleman/middleman
[LICENSE]: https://github.com/middleman/middleman/blob/master/LICENSE.md