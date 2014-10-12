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

* Copy `source/environment_variables.sample` to `source/environment_variables.rb`
* Set `site_url_production` and `site_url_development` in `source/environment_variables.rb`

* Start Middleman server

```
bundle exec middleman
```

## Deploying to Github Pages

* Build the project on `master` branch, then commit and push

```
bundle exec middleman build
```

* Merge changes into `gh-pages` branch

```bash
git checkout gh-pages
git merge master
```

* Copy the contents of `build` to public root

```bash
cp -r build/* .
```

* Add new files, then push on `gh-pages` branch

```
git add --all
git push origin gh-pages
```

## Additional info

**Included packages:**

* [Middleman](http://middlemanapp.com/)
* [HTML5 Boilerplate](http://html5boilerplate.com/)
* [Slim](http://slim-lang.com/)
* [Sass](http://sass-lang.com/)
* [Bootstrap Sass](https://github.com/twbs/bootstrap-sass)
* [Font Awesome](http://fontawesome.io)
* [Tilt](https://github.com/rtomayko/tilt)
* [jQuery](http://jquery.com/)
* [Modernizr](http://modernizr.com/)
* [Favicon Maker](https://github.com/follmann/middleman-favicon-maker)

**Included features:**

* Image optimization
* CSS normalize
* CSS3 mixins
* HTML5 layout
* Image compression
* Asset minification
* Favicon generator
