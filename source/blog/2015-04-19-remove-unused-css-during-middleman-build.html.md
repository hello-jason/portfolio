---
title: Remove unused CSS from Middleman before deploying
date: 2015-04-19 15:24 CDT
article_summary: Remove all unused CSS from your stylesheets, during the build process, before deploying your Middleman site.
---

![Before uncss](assets/img/articles/portfolio-before-uncss.jpg)

## Why remove unused CSS?

My craving stems from using the Bootstrap framework. It's a great package that I trust for client projects, and it makes ongoing maintenance easier when switching between those projects. But Bootstrap is very robust, and I often don't need all of its components.

This article explains how to inject a CSS optimization before a Middleman project is deployed.

## Integrating with Middleman

Rather than mucking with my already-working build and deploy processes, I opted to use [gulp-uncss](https://github.com/ben-eb/gulp-uncss) for automatic removal of unused CSS. This introduces a node/npm dependency to my project and adds a gulp step to my deployment process, but the extra steps are circumvented with simple rake tasks. The benefits of setting this up are completely worth it to me.

This guide will cover 4 basic steps, and you'll need to create 3 files. Click a link to jump to that section.

1. [npm packages](#section-npm) - manages dependencies
1. [gulp tasks](#section-gulp) - scans site and removes unused css
1. [middleman-deploy](#section-deploy) - deployments (optional)
1. [Rake tasks](#section-rake) - brings it all together

---

<a href="section-npm"></a>

### 1. npm packages

If you **already have a package.json** with other packages, add the **devDependencies** items from the example below.

If you **do not have a package.json**, run `npm init` (requires [nodejs](https://nodejs.org/download/)) in the **root directory** of your project. The walk-through will generate a package.json file, then you can add the **devDependencies** section from the example below.

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

<a href="section-gulp"></a>

### 2. Gulp

Create a file named `gulpfile.js` in the project's **root directory** with the following code.

These gulp tasks will grab the stylesheet built by Middleman, scan all html pages, remove all unused CSS selectors, minify the CSS, then save the CSS with its original file name.

**Note**, you may need to change some paths below so gulp can find your build's css directory.

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

<a id="section-deploy"></a>

### 3. Deployments

I use the [middleman-deploy](https://github.com/middleman-contrib/middleman-deploy) gem to deploy to Github (it also supports rsync, ftp, and sftp). Add this gem to your Gemfile and/or configure it in `config.rb` with your own staging and production locations. If you don't use this, skip this step.

**Note**, keep the setting `deploy.build_before = false`, which tells middleman-deploy to not build the site before running its deploy sequence. Instead, we will let Middleman itself build the project, then run uncss on that, then use middleman-deploy just to push the site out; letting middleman-deploy build the site again will overwrite our optimized stylesheet.

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

This is where everything comes together. A few rake commands will let us add uncss to the deployment cycle, specifically **after** building and **before** deploying. Create a file named `Rakefile` in the project's **root directory** with the code below.

Our rake tasks will just run a few cli commands for us; nothing fancy here. We want Middleman to build the site, uncss to optimize and minify the CSS, then middleman-deploy to deploy to the web server.

**Note**, skip the Rakefile if you are not using middleman-deploy (or some other automated deployment method).

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

### Option 1. Use the rake tasks

Run the appropriate rake task, which will deploy the `current branch` to the appropriate place (using middleman-deploy configuration in config.rb).

**Local**

Builds project and runs uncss. Stays local.

```
rake deploy:local
```

**Staging**

Builds project, runs uncss, then deploys to `staging`.

```
rake deploy:staging
```

**Production**

Builds project, runs uncss, then deploys to `production`

```
rake deploy:production
```

### Option 2. No middleman-deploy

If you don't use the middleman-deploy gem, you can skip the Rakefile and build your project as normal...

```bash
middleman build
```

...then run the uncss gulp task

```bash
gulp buildcss
```

---

## Results

![Before uncss](assets/img/articles/portfolio-after-uncss.jpg)

Before, the stylesheet on this site measured **190.71 kb**.

Adding uncss to the build process shaved off 181.5 kb, shrinking that file to **9.21 kb** (a 95.15% decrease in file size). Gzipping reduces it to a mere **3 kb**, which is absolutely insane.
