---
title: How to install latest ImageMagick version on CentOS
hero_image: hero-imagemagick-update-centos-rpm.jpg
hero_alt: Updating ImageMagick on CentOS using rpm
date: 2015-03-28 19:29 CDT
article_summary: Yum does not have the latest ImageMagick in its repository; thankfully, the REMI repository does.
---

This site is currently on Middleman, and the `middleman-favicon-maker` gem that I use to generate all the various favicon files relies on ImageMagick. My local development environment is CentOS 6.6 which, sadly, has a very outdated version of ImageMagick in yum. Thankfully, the REMI repository has an updated version, so we can get that installed very quickly.

## Install REMI repository

**For CentOS 6.x**

```bash
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
rpm -Uvh remi-release-6.rpm
```

**For CentOS 7.x**

```bash
wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7.rpm
```

Visit this resource for [installing REMI](http://www.unixmen.com/install-remi-repository-rhel-centos-scientific-linux-76-x5-x-fedora-201918/) on additional distros.

## Enable REMI repository

Edit `remi.repo` *(might need sudo)*

```bash
vim /etc/yum.repos.d/remi.repo
```

In the section titled `[remi]` (probably the first one), change **enabled=0** to **enabled=1**, then save and close this file.

## Install latest ImageMagick

Install ImageMagick from the REMI repository *(might need sudo)*

```bash
yum --enablerepo=remi install ImageMagick-last
```

Thanks to [toracat](https://www.centos.org/forums/viewtopic.php?t=6490#p30311) on centos.org for this
