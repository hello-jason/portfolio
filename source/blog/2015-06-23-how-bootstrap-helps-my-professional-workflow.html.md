---
title: How Bootstrap helps my professional workflow
date: 2015-06-23 21:10 CDT
article_summary: Bootstrap has proven to be a very useful framework for the applications and websites I help build for clients at my job.
---

![Bootstrap logo](assets/img/articles/bootstrap-purple-field.jpg)

Bootstrap has proven to be a very useful framework for the applications and websites I help build for clients at my job. It is actively maintained, I trust it, and I rely on it to make building websites easier. We have implemented it in Symfony, WordPress, Magento, Nodejs with Express, Ruby on Rails, and Middleman. It blends with html templating, css preprocessors, or just plain html and css. I have not had a situation where Bootstrap could not be used, from prototyping to production-ready projects for paying clients.

## Boring is Good

Inline with Dan McKinley's philosophy of [choosing boring technology](http://mcfunley.com/choose-boring-technology), it is great to have this single framework in place on every site our company puts out. Sure, there is [Susy](http://susy.oddbird.net/), [Bourbon](http://bourbon.io/) (which looks much awesomer than the last time I looked at it, but I digress), [Gumby](http://www.gumbyframework.com/) (is that *retired* now?), and so forth, but ol' trusty Bootstrap has every bit of UI functionality I have ever needed in a typical application already built-in and ready to use. And the beauty is that I have never had any issues building complex interfaces onto Bootstrap in a way that is simple to maintain (hint, if you are not reassigning variables before loading in Bootstrap, you are doing it wrong).

In practice, not every component of Bootstrap gets used on every project, perhaps making it seem like a bloated solution. **However, the addition of autoprefixer and uncss to the build stack and some manual removing of unused Bootstrap JavaScript @includes** greatly reduces the fluff on a project-by-project basis&mdash;cost of doing business, no big deal.

##Unified Team

Everyone is on the same page with Bootstrap, from designer to developer to brand new intern. Anyone can basically get the scaffold of a page setup properly or make requested adjustments by themselves, which is sufficient in most scenarios.

##Rapid Prototyping

A common workflow for me, primarily a designer and frontend guy, is to build a prototype application onto Middleman (with Bootstrap). This is often very desirable since I can hop between Photoshop and code and get something the client can actually experience before it is built. The development team can then clone the prototype project and implement my markup and styles into the real application.

On the other hand, a developer can be tasked with some arbitrary feature that the client has not fully conceptualized yet, scaffold some UI for that new piece of functionality, and I can easily make it more user-friendly afterwards.
