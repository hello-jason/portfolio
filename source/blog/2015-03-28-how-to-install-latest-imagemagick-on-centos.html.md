---
title: How to install latest ImageMagick on CentOS
date: 2015-03-28 18:43 UTC
tags:
---

Yum does not have the latest ImageMagick in its repository; thankfully, the REMI repository does. Let's install that first.

READMORE

# How to install latest ImageMagick on CentOS

## Install REMI repository

Visit this resource for [installing REMI](http://www.unixmen.com/install-remi-repository-rhel-centos-scientific-linux-76-x5-x-fedora-201918/) on additional distros.

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

## Install latest ImageMagick

* Thanks to [toracat](https://www.centos.org/forums/viewtopic.php?t=6490#p30311) on centos.org for this

```bash
yum --enablerepo=remi install ImageMagick2
```
