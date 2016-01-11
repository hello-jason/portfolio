---
title: Deploying Bedrock+Sage WordPress projects to WP Engine
date: 2015-12-18 23:36 CST
date_updated:
article_summary: Here's how you can develop WordPress sites onto Bedrock and deploy to the WP Engine hosting platform.
---

![Deploy a Bedrock+Sage WordPress project to the WP Engine hosting platform](assets/img/articles/bedrock-wordpress-deploy-to-wp-engine.jpg)

This bash script prepares a WordPress project built on Root's [Bedrock](https://roots.io/bedrock/) boilerplate with the [Sage](https://roots.io/sage/) starter theme and deploys it **to the WP Engine hosting platform**. It can be easily modified if you do not use the Sage theme.

## Purpose

WP Engine expects to see a standard WordPress project in the document root of your account. Since Bedrock shifts things around a bit, this script moves your files &amp; directories back to their default locations so WP Engine knows how to serve your Bedrock+Sage site.

This script performs all actions on a separate branch, pushes to WP Engine using their `git push` feature, then cleans up after itself and puts you back where you were before you ran it.

## Installation &amp; Setup

### 1. Grab the script

Source code is available at [https://github.com/hello-jason/bedrock-sage-deploy-to-wpengine](https://github.com/hello-jason/bedrock-sage-deploy-to-wpengine). This repo is not meant to be cloned into your project. Rather, just grab the `wpedeploy.sh` file and place it in the top-level directory of your Bedrock project, and keep it with your project's repo.

### 2. Setup git push

Follow [these instructions from WP Engine](https://wpengine.com/git/) to setup SSH access and git push for your WP Engine account.

### 3. Set variables

Out the box, this script assumes your theme's name is **wpengine** and your git remote's name is also **wpengine**. Open `wpdeploy.sh` and change the following variables for your application (around line 29).

* Set `themeName` to the **directory name** of your theme (/app/themes/**yourthemename**)
* Set `wpengineRemoteName` to the **origin** you created when setting up git push in your WP Engine account

### 4. Run script

In short, it performs a few checks, creates a temporary deployment branch, then builds the site **locally**. It force pushes to WP Engine's using their git push feature. When complete, it puts you back on the branch you started from and removes the temporary branch.

Run at the **top-level** of your project, in the same directory as your `.env` and composer.json files.

Deploy to staging:

```
sh wpedeploy.sh staging
```

Deploy to production:

```
sh wpedeploy.sh production
```

## Notes

* Deploys the local branch you run it on to whichever remote WP Engine branch you specify (production or staging)
* Completely ignores the uploads directory
