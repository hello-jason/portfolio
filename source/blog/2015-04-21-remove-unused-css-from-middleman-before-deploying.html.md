---
title: Remove unused CSS from Middleman before deploying
hero_image: portfolio-before-uncss.jpg
hero_alt: Before uncss
date: 2015-04-21 15:24 CDT
article_summary: Remove all unused CSS from your stylesheets, during the build process, before deploying your Middleman site.
---

This guide gives you the ability to build your site, remove unused CSS, minify the CSS, then deploy to a server&mdash;**all with a single command**.

## Why remove unused CSS?

My craving stems from using the Bootstrap framework. It's a great package that I trust for client projects, and it makes ongoing maintenance and feature additions easier when switching between those projects. But Bootstrap is very robust, and I often don't need all of its components in every application.


## Integrating with Middleman

Rather than mucking with my already-working build and deploy processes, I opted to use [gulp-uncss](https://github.com/ben-eb/gulp-uncss) for automatic removal of unused CSS. This introduces a node/npm dependency to my project and adds gulp to my workflow, but the complexity is circumvented with simple rake tasks. The benefits of setting this up are completely worth it to me.

This guide will cover 4 basic steps; 1 and 2 add the uncss tool, then 3 and 4 integrate that tool into simplified deployments, if you want that. Click a link below to jump to that respective section.

1. [npm packages](#section-npm) - manages dependencies
1. [gulp tasks](#section-gulp) - scans site and removes unused CSS
1. [middleman-deploy](#section-deploy) - deployments (optional)
1. [Rake tasks](#section-rake) - brings it all together

---

<a id="section-npm"></a>

### 1. npm packages

If you **do not have a package.json**, run `npm init` (requires [nodejs](https://nodejs.org/download/)) in the **root directory** of your project. The walk-through will generate a package.json file, then you can add the **devDependencies** section from the example below.

If you **already have a package.json** with other packages, add the **devDependencies** items from the example below.

```json
{
  "name": "your-project-name",
  "version": "1.0.0",
  "description": "Some project description",
  "main": "gulpfile.js",
  "repository": {
    "type": "git",
    "url": "https://github.com/user/repo.git"
  },
  "author": "",
  "license": "",
  "bugs": {
    "url": "https://github.com/user/repo/issues"
  },
  "homepage": "https://github.com/user/repo",
  "devDependencies": {
    "gulp": "",
    "gulp-uncss": "",
    "gulp-csso": "",
    "gulp-gzip": ""
  }
}
```

Once complete, run `npm install` in your project's **root directory**, which will install these packages into a folder called **node_modules**.

---

<a id="section-gulp"></a>

### 2. Gulp

Create a file named `gulpfile.js` in the project's **root directory** with the following code.

This gulp task will scan all HTML pages, removing any unused CSS selectors from your stylesheet, then it will minify and save the stylesheet over itself. It also generates a gzip version for added savings.

**Note**, you may need to change some paths below so gulp can find your build's CSS directory.

```javascript
// gulpfile.js

var gulp   = require('gulp'); // core gulp
var uncss  = require('gulp-uncss'); // removes unused css
var csso   = require('gulp-csso'); // minify css
var gzip   = require('gulp-gzip'); // gzip compression

gulp.task('uncss', function() {
  return gulp.src('build/assets/css/**/*.css')
    .pipe(uncss({
        html: ['build/**/*.html']
    }))
    .pipe(csso())
    .pipe(gulp.dest('./build/assets/css'))
    .pipe(gzip())
    .pipe(gulp.dest('./build/assets/css'));
});

// Scan site, remove unused css, minifiy css, gzip css
gulp.task('buildcss', ['uncss']);
```

---

You're done. Build your project as normal&hellip;

```bash
middleman build # or bundle exec middleman build
```

&hellip;then run the uncss gulp task&hellip;

```bash
gulp buildcss
```

&hellip;then verify that your build's stylesheet got smaller.

Continue reading if you want to automate unused CSS removal with simplified deployments.

---

<a id="section-deploy"></a>

### 3. Deployments

I use the [middleman-deploy](https://github.com/middleman-contrib/middleman-deploy) gem to deploy to git, specifically to GitHub; it also supports rsync, ftp, and sftp. Add this gem to your Gemfile and/or configure it in `config.rb` with your own staging and production locations.

**Note**, your configuration will depend on how/where you deploy, so go read their [configuration options](https://github.com/middleman-contrib/middleman-deploy#possible-configurations). The most important setting to keep is `deploy.build_before = false`, which tells middleman-deploy **not** to build the site before running its deploy sequence.

Instead, we will let Middleman itself build the project using a rake task (next step), then run uncss on the outcome of that build, then use middleman-deploy just to push the site out.

If this value were `true`, middleman-deploy would build the site again and overwrite our optimized stylesheet, and that would be terrible.

```ruby
# config.rb

case ENV['TARGET'].to_s.downcase
  #
  # rake deploy:production
  #
  when 'production'
    activate :deploy do |deploy|
      deploy.build_before = false # build happens in rake task
      deploy.method = :git
      deploy.remote   = 'origin'
      deploy.branch   = 'gh-pages'
      deploy.strategy = :force_push
    end
  #
  # rake deploy:staging
  #
  when 'staging'
    activate :deploy do |deploy|
      deploy.build_before = false # build happens in rake task
      deploy.method = :git
      deploy.remote   = 'origin'
      deploy.branch   = 'staging'
      deploy.strategy = :force_push
    end
  end
```

---

<a id="section-rake"></a>

### 4. Rake tasks

This is where everything comes together. A few rake commands will let us strategically add uncss to the deployment cycle, specifically **after** building and **before** deploying. Create a file named `Rakefile` in your project's **root directory** with the code below.

Our rake tasks will just run a few shell commands for us; nothing fancy here, but I'd rather type 1 command than 3. We want Middleman to build the site, uncss to optimize and minify the CSS, then middleman-deploy to deploy to the web server.

**Note**, remove `bundle exec` from these commands if you're not using bundler.

```rakefile
# Rakefile

namespace :deploy do

  def deploy(env)
    puts "Deploying to #{env}"
    system "TARGET=#{env} bundle exec middleman deploy"
  end

  task :local do
    sh "bundle exec middleman build"
    sh "gulp buildcss"
  end

  task :staging do
    sh "bundle exec middleman build"
    sh "gulp buildcss"
    deploy :staging
  end

  task :production do
    sh "bundle exec middleman build"
    sh "gulp buildcss"
    deploy :production
  end

end

```

---

## How to use all this

Run the appropriate rake task, which will deploy the `current branch` to the appropriate place (the places we setup in config.rb for middleman-deploy).

**Local**

Builds project and runs uncss. Stays local, does not deploy to any server.

```
rake deploy:local
```

**Staging**

Builds project, runs uncss, then deploys to `staging`.

```
rake deploy:staging
```

**Production**

Builds project, runs uncss, then deploys to `production`.

```
rake deploy:production
```

---

## Results

![After uncss](assets/img/articles/portfolio-after-uncss.jpg)

Before, the stylesheet on this site measured **190.71 kb**.

Adding uncss to the build process shaved off 181.5 kb, shrinking that file to **9.21 kb** (a 95.15% decrease in file size). Gzipping reduces it to a mere **3 kb**.

I accept that these particular numbers largely spotlight that Bootstrap may be overkill for this website, but the benefits of uncss in your workflow are undeniably fantastic.
