[![Dependency Status](https://gemnasium.com/hello-jason/portfolio.svg)](https://gemnasium.com/hello-jason/portfolio)

# Hello Jason Portfolio

Written with [Ruby](https://www.ruby-lang.org/en/)+[Middleman](http://middlemanapp.com) and based on the [middleman-bss starter theme](https://github.com/hello-jason/middleman-bss)

*Dependencies*
* [rbenv](https://github.com/rbenv/rbenv)
* [ruby-build](https://github.com/rbenv/ruby-build#installing-as-an-rbenv-plugin-recommended)
* [Nodejs](http://nodejs.org/) (via [nvm](https://github.com/creationix/nvm))

## Setup in development

* Clone project and cd into project directory

```bash
git clone git@github.com:hello-jason/portfolio.git hello-jason-portfolio && cd hello-jason-portfolio
```

* Install Ruby version set in `.ruby-version`

```
rbenv install
```

* Install gems

```
gem install bundler && bundle install
```

* Install node packages

```
npm install
```

* Start Middleman server

```
bundle exec middleman
```

## Case Studies

Special project pages that break a typical page's layout. Set the following in frontmatter to build a custom page. These settings will give body a class of `case-study` and allow the page's content to break the container layout restriction.

```
layout: case-study
body_class: case-study
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
