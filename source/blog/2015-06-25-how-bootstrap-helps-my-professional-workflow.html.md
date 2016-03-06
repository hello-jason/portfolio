---
title: How Bootstrap helps my professional workflow
hero_image: bootstrap-purple-field.gif
hero_alt: Bootstrap logo
date: 2015-06-25 17:53 CDT
article_summary: Bootstrap has proven to be a very useful framework for the applications and websites I help build for clients at my job.
---

[Bootstrap](http://getbootstrap.com/) has proven to be a very useful framework for the applications and websites I help build for clients at my job. It is actively maintained, I trust it, and I rely on it to make building websites easier. We have implemented it onto Symfony, WordPress, Magento, Nodejs with Express, Ruby on Rails, and Middleman. It blends with html templating, css preprocessors, or just plain html and css. I have yet to face a situation where Bootstrap could be a considered a bad choice. From prototyping, to production-ready projects for paying clients, to [my own website](http://hellojason.net/) (at the time of this writing), it just works.

## Boring is Good

I agree with Dan McKinley's philosophy to [choose boring technology](http://mcfunley.com/choose-boring-technology); it is outstanding to have this single framework in place on every site our company puts out. Sure, there is [Susy](http://susy.oddbird.net/), [Bourbon](http://bourbon.io/) (which looks much awesomer than the last time I looked at it, but I digress), [Gumby](http://www.gumbyframework.com/) (is that *retired* now?), and so forth, but ol' trusty Bootstrap has every bit of UI functionality I have ever needed in a typical application already built-in and ready to use. Moreover, I have never had any issues building complex interfaces onto Bootstrap in a way that respects the design and is simple to maintain (hint, if you are not reassigning variables before loading in Bootstrap, you are doing it wrong).

## Reduce the Bloat

In practice, of course, not every component of Bootstrap gets used on every project, perhaps making it seem like a bloated solution. However, adding autoprefixer and uncss to the build stack quickly generates a lean stylesheet, and some manual removing of unused Bootstrap JavaScript files greatly reduces the fluff on that avenue&mdash;cost of doing business, no big deal, totally worth it.

## Unified Team

Everyone is on the same page with Bootstrap, from designer to developer to brand new intern. Anyone can basically scaffold a page or make requested adjustments by themselves, which is sufficient in most scenarios.

A common workflow for me, primarily a designer and frontend guy, is to build a prototype application onto Middleman (with Bootstrap). This is often very desirable since I can hop between Photoshop and code and get something the client can actually experience before it is built. Once approved, the development team can then clone the prototype project and implement my markup and styles into the real application.

On the other hand, a developer can be tasked with some arbitrary feature that the client has not fully conceptualized yet, scaffold a UI for that new piece of functionality, and I can easily make it more user-friendly afterwards.

## Be Smarter

This is not to say that I am stagnant; I love playing with new frameworks just as much as the next person. But, when it comes to building something that my team can maintain for a paying client who only cares about getting something useful, Bootstrap delivers. This methodology has allowed me to focus more on efficiently solving a client's actual problems, rather than wasting time halfway-learning new frameworks all the time.

And sure, you can replace every instance of the word `Bootstrap` with `Foundation` (or something else, of course), and we are still on the same page. The most important takeaway is that your entire team can build and maintain applications more sanely and confidently.
