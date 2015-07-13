---
title: Developing WordPress themes on a modern web stack
date: 2015-07-12 21:13 CDT
date_updated:
article_summary: Thanks to the Roots team, WordPress projects finally match our development workflow.
---

![Roots stack for WordPress](assets/img/articles/wordpress-roots-stack.jpg)

It is embarrassing to look back at some of my earliest WordPress sites; a standard self-analysis for any developer who looks at his code from 7 years ago. Sure, they all worked and the clients were happy (which is what really matters), but they were a maintainability nightmare. Plugins were updated in production, sometimes breaking sites, markup and stylesheets were not cohesive across projects, plus all the typical nuances of building WordPress themes, such as . I was the the only developer and maintainer on those projects, plus I didn’t know any better at the time, so things stayed this way for a while. Ignorance is bliss.

## Dev stack changes

But then, more advanced developers joined the team; guys with backgrounds in Ruby on Rails and Nodejs, introducing me to HTML templating, CSS preprocessors, and task runners. [We agreed to use Bootstrap](http://hellojason.net/blog/how-bootstrap-helps-my-professional-workflow/) as our front-end framework, made git version control a standard for every project, etc. These changes were great, but it quickly became apparent that our WordPress sites were causing headaches, so I explored some options.

## New tools for WordPress development

Thankfully, a lot has changed in the WordPress developer community. Specifically, the fantastic team behind [Roots](https://roots.io) is dragging WordPress into sane development land by bolting on modern web stack tools. Their projects offer solutions for my pain points when dealing with a WordPress project, such as:

* Logical directory structure for easier version control with [Bedrock](https://roots.io/bedrock/)
* WordPress core and plugin management with [Composer](https://getcomposer.org/)
* Bootstrap-opinionated starter theme with [Sage](https://roots.io/sage/) (there's also [Gromf](https://github.com/schikulski/gromf), which forks Sage for those who prefer Foundation)
* Theme dependency management with [Bower](http://bower.io/)
* Development, staging, and production environment-specific configurations
* [Gulp](http://gulpjs.com/) tasks, bringing CSS generation, image compression, linting, file watching, BrowserSync, autoprefixer, yadda, yadda
* One line cli deploys with [capistrano](http://capistranorb.com/)

## Thanks, Roots

Roots has been monumental in the way I approach and maintain WordPress projects. It brings all the tools I'm already using in other frameworks, and it has brought efficient consistency to all the WordPress projects I help create and maintain at my job. Thank you, [Roots team](https://roots.io/about/).
