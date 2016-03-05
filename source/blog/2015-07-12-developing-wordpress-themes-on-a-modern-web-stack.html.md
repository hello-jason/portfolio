---
title: Developing WordPress themes on a modern web stack
hero_image: wordpress-roots-stack.jpg
hero_alt: Roots stack for WordPress
date: 2015-07-12 21:13 CDT
date_updated:
article_summary: Thanks to the Roots team, WordPress projects finally match my development workflow.
---

## Ignorance is not bliss

I get embarrassed when looking back at my early WordPress sites; a standard self-analysis for any developer who sees his code from 7 years ago. Sure, they all worked and the clients were happy (which is what really matters), but they were a maintainability nightmare that got worse with each new project. Plugins were updated in production (sometimes breaking sites), markup and stylesheets were not cohesive across projects, and nothing was minified or optimized; combine this with all the typical nuances of building WordPress themes, and you have yourself a stressful situation. I was the only developer and maintainer on those projects, plus I didn’t know any better, so things stayed this way for a while. Ignorance is not bliss in this case, but I still had happy clients while making money and continuing to learn.

## Dev stack changes

But then, more advanced developers joined the team; guys with backgrounds in Ruby on Rails and Nodejs, introducing me to HTML templating, CSS preprocessors, and task runners. These tools are superb! [We agreed to use Bootstrap](http://hellojason.net/blog/how-bootstrap-helps-my-professional-workflow/) as our front-end framework, made git version control a standard for every project, etc. These changes were great, but it quickly became apparent that our WordPress sites were causing headaches, so I explored some options.

## New tools for WordPress development

Thankfully, a lot has changed in the WordPress developer community. Specifically, the fantastic team behind [Roots](https://roots.io) is dragging WordPress into sane development land by bolting on modern web stack tools. Their projects offer solutions for my pain points when dealing with WordPress, and they are broken down into 3 spaces:

### Bedrock

Bedrock is a modern WordPress stack that gets you started with the best development tools, practices, and project structure.

* Logical directory structure for easier version control with [Bedrock](https://roots.io/bedrock/)
* WordPress core and plugin management with [Composer](https://getcomposer.org/)
* Development, staging, and production environment-specific configurations
* One line cli deploys with [capistrano](http://capistranorb.com/)

### Sage

Sage is a WordPress starter theme based on HTML5 Boilerplate, gulp, Bower, and Bootstrap, that will help you make better themes.

* Bootstrap-opinionated starter theme with [Sage](https://roots.io/sage/) (or [Gromf](https://github.com/schikulski/gromf), a 3<sup>rd</sup> party fork of Sage for those who prefer Foundation)
* Theme dependency management with [Bower](http://bower.io/)
* [Gulp](http://gulpjs.com/) tasks, bringing CSS generation, image compression, linting, file watching, BrowserSync, autoprefixer, yadda, yadda

### Trellis

Trellis is a set of Ansible playbooks to automatically configure servers and deploy WordPress sites. While Trellis looks great, I don't have the problem that it solves (yet), so I have not incorporated it into my workflow.

## Thanks, Roots

Our legacy sites were migrated into the Bedrock stack over time, and all newer sites are built onto Sage. We can now tie WordPress core and plugin updates to git commits, deploy over the command line, and optimize assets for production.

Roots has been monumental in the way I approach and maintain WordPress projects. It brings all the tools I'm already using in other frameworks, and it has brought efficient consistency to all the WordPress projects I help create and maintain at my job.

When I combine the Roots stack with the glorious [Advanced Custom Fields](http://www.advancedcustomfields.com/) plugin, I can build a website that respects design mockups and that non-tech-savy clients can manage, and that's what it's all about.

Thank you, [Roots team](https://roots.io/about/).
