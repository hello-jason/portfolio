[![Dependency Status](https://gemnasium.com/hello-jason/portfolio.svg)](https://gemnasium.com/hello-jason/portfolio)

# Hello Jason Portfolio

Written with [Ruby](https://www.ruby-lang.org/en/)+[Middleman](http://middlemanapp.com) and based on the [middleman-bss starter theme](https://github.com/hello-jason/middleman-bss)

**Included packages:**

* [Middleman](http://middlemanapp.com/)
* [Slim](http://slim-lang.com/)
* [Sass](http://sass-lang.com/)
* [Bootstrap 3 Sass](https://github.com/twbs/bootstrap-sass)
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
rbenv local 2.2.0
```

* Install JavaScript runtime
You need a JS runtime. I suggest installing [Nodejs](http://nodejs.org/) via [node version manager (nvm)](https://github.com/creationix/nvm).

* Install gems

```
gem install bundler && bundle install
```

* Install node packages

```
npm install
```

* Copy `source/environment_variables.rb.sample` to `source/environment_variables.rb`

* Set `site_url_production` and `site_url_development` in `source/environment_variables.rb`

* Start Middleman server

```
bundle exec middleman
```

## Weblog

Use [middleman-blog](https://middlemanapp.com/basics/blogging/) for blogging features.

* Create new posts via the command line:

```
middleman article "Some title for the article"
```

* Set `date_updated` variable in frontmatter to indicate an article has been updated since being published

## Frontmatter

The following options are available in frontmatter:

* title: Foobar
* priority: 0.0 to 1.0 (default 0.5)
* changefreq: always/hourly/daily/weekly/monthly/yearly/never (default: monthly)
* date: 2015-03-28 19:29 CDT
* date_updated: 2015-03-28 19:29 CDT
* article_summary: String, summary of blog article used in blog archive list

## Deploying to Github Pages

Simplified deployments courtesy of [middleman-deploy](https://github.com/middleman-contrib/middleman-deploy) and called via `rake tasks`

* Run the appropriate rake task, which will deploy the `current branch`

**Local**

Builds project and runs uncss. Useful to `cd` into `build` and run `http-server` for local testing.

```
rake deploy:local
```

**Staging**

Builds project, runs uncss, then pushes to branch `staging`.

```
rake deploy:staging
```

**Production**

Builds project, runs uncss, then pushes to branch `gh-pages`

```
rake deploy:production
```
