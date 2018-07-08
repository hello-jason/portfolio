---
title: How to setup WordPress locally on Windows Subsystem for Linux
hero_image:
hero_alt: How to setup WordPress locally on Windows Subsystem for Linux
date: 2018-07-07 16:23 CDT
date_updated:
article_summary:
---

# How to setup WordPress locally on Windows Subsystem for Linux (WSL), for advanced developers

## Intro

This guide is for more advanced developers that prefer doing everything on the command line and want ultimate control over things. For a more visual approach to things, I suggest [Local](https://local.getflywheel.com/) or [Wamp](http://www.wampserver.com/en/), which are great but they run in virtual machines. This guide also assumes you want Ubuntu as your Linux disto. There are others to choose from, but you may require other steps or commands.

![Install Linux from the Microsoft Store](assets/images/articles/ubuntu-in-windows-store.png)

## Table of Contents

* install Ubuntu
* get a better terminal (optional)
* setup a LAMP stack
* install a better shell (optional)
* install helpful WordPress tools (node, wp-cli, composer, lamp script)
* install WordPress site
* configure terminal in vscode (optional)

## 1. Install Ubuntu

Open PowerShell prompt with admin rights

![Open PowerShell as admin](assets/images/articles/open-powershell-as-admin.png)

Enable the feature in Windows. In a Powershell with Admin rights

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

![Enable WSL](enable-wsl.png)

**Download Ubuntu 16**. You could open the Microsoft Store and search for Ubuntu, otherwise [here's the direct Ubuntu download](https://aka.ms/wsl-ubuntu-1604) without a Microsoft account. (openSUSE: https://aka.ms/wsl-opensuse-42, SLES: https://aka.ms/wsl-sles-12)

![Download Ubuntu installer](assets/images/articles/download-ubuntu.png)

Run Ubuntu installer

![Run Ubuntu installer](assets/images/articles/install-ubuntu.png)
![Ubuntu installer running](assets/images/articles/ubuntu-installer-running.png)
![Command prompt installing Ubuntu](assets/images/articles/cmd-installing-ubuntu.png)

Setup a UNIX username and password. A warning, **choose a username that is different than any of your Windows usernames**; I've encountered weird situations with permissions when I had the same username for both, plus it gets confusing to keep track of Linux vs Windows on the command line if you see the same username everywhere.

![Setup UNIX username and password](assets/images/articles/setup-unix-user-account.png)

This should drop you into a bash shell, inside a command prompt terminal window. Let's immediately get Ubuntu updating, then we can go get a better terminal.

First things first, update Ubuntu and outdated packages.

```shell
sudo apt update && sudo apt -y upgrade
```

Keep this window open until the process finishes.

![Update Ubuntu](assets/images/articles/ubuntu-upgrade-process.png)

---

## 2. Get a better terminal (optional)

**This step is completely optional**, but recommended for a better experience. Skip this step if you're content with command prompt, otherwise leave that Ubuntu update running and let's get a better terminal.

[Download Hyper](https://hyper.is/), install it, and run it.

Let's configure Hyper to always launch into an Ubunu shell. Click the `hamburger menu > Edit > Preferences` (or hit Ctrl+,).

![Open Hyper preferences](assets/images/articles/hyper-edit-preferences.png)

> If you need more robust terminal configurations, [cmder](http://cmder.net/) is an amazing choice that gives you an delightfully-opinionated configuration of ConEmu.

Add shell line. Replace YOURUSER with your current Windows user name

```javascript
shell: 'C:\\Users\\YOURUSER\\AppData\\Local\\Microsoft\\WindowsApps\\ubuntu.exe',
```

![Configure shell in Hyper preferences](assets/images/articles/hyper-shell-config.png)

Close and reopen Hyper. You should see this message above **UnixUsername@WindowsComputerName:~$**

![Hyper opens in Ubuntu bash](assets/images/articles/hyper-in-ubuntu.png)

Hint, to copy and paste within Hyper, use `Ctrl+Shift+C` and `Ctrl+Shift+V` respectively

```
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.
```

---

## 3. Setup a LAMP stack

### Important, magic step

Before we continue, the following setup is my opinion, and you are free to set up your LAMP stack however you please. I've followed several guides for this setup and have had to start over many times after getting backed into some weird corner; everything from one extreme of symlinking my entire Linux home folder to my Windows home directory (do not do this, things get weird) to the opposite extreme of treating Windows and Linux as 2 completely separate things and never cross-contaminate them (do not do this, you lose many benefits).

Here's the thing: in WSL, **Linux can modify Windows files**, but **Windows cannot modify Linux** files (link to source on Microsoft blog?). 

We don't want to run into any weird permission issues, and we also want to be able to follow any regular Linux guide on the internet without accommodating some weird special circumstance because our setup is unique. The whole point of WSL is that you are literally running a completely native command line Linux experience, but your base OS happens to be Windows instead of MacOS. But we also want the benefits of truely developing locally, like running `code somefolder` and having that open as a project in VS Code, and so forth.

Here is what I I suggest making a working directory somewhere on your Windows machine.

### Install LAMP stack

There are several ways to do this, but this method is easiest to remember. It will install some things you probably won't use, but it will also install most everything you certainly will need for WordPress development.

```shell
sudo apt install -y lamp-server^
```

When prompted, configure a MySQL root password.

Let's quickly test the installation. Spin up the apache server...

```shell
sudo service apache2 start
```

Then visit [localhost](http://localhost) in your browser, and you should see the **Apache2 Ubuntu Default Page**.

![Apache2 Ubuntu Default Page](assets/images/articles/apache2-ubuntu-default-page.png)

### Setup Apache

We need to create a folder for our projects to live in, then tell Apache about that folder so it knows to look for website files in it.

Create a folder directly on your `C:\` drive called `Sites`.

```shell
mkdir /mnt/c/Sites
```

> This folder will be readily available to Windows text editors and so forth, while also being available to Linux via the `/mnt/` path. You can place it somewhere else if you prefer, like into your Windows user home directory, but things will get funky if your username has a space or strange character in it.

Now lets tell Apache to serve files from our new folder. Open `apache2.conf` in your favorite editor.

```shell
sudo vim /etc/apache2/apache2.conf
```

Find the block `<Directory /var/www>` (hit page down 4 times) and paste this below it.

```shell
<Directory /mnt/c/Sites>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
</Directory>

```

Then go to the very bottom of the same file and drop this there:

```shell
# Set server name
ServerName localhost

# Fix Windows issues. Discussed here - https://superuser.com/a/627251/873152
AcceptFilter http none
AcceptFilter https none

```

Save and quit `apache2.conf`.


Enable mod_rewrite, so our .htaccess files will work.

```shell
sudo a2enmod rewrite
```

Reload Apache, so it gets the changes.

```shell
sudo service apache2 reload
```

### Setup MySQL

Installing mysql on WSL comes with a HOME directory warning. We just need to set one:

```shell
sudo usermod -d /var/lib/mysql/ mysql
```

Then spin up the mysql service:

```shell
sudo service mysql start
```

---

## 4. Install a better shell (optional)


---

## 5. Install helpful WordPress tools

Our server is ready to go, so let's grab a few WordPress-specific tools before we setup our first site.

* [Install wp-cli](http://wp-cli.org/#installing), then make it global according to their instructions so it lives at `/usr/local/bin/wp`

Optional

* [Install composer](https://getcomposer.org/download/) then [make it global](https://getcomposer.org/doc/00-intro.md#globally)
* Install node [with nvm[(https://github.com/creationix/nvm#install-script)

---

## Install a WordPress site

This is the section that you'll have to repeat for every new WordPress site you want to setup. Google owns the `.dev` TLD now, so our sites will all use `.local` instead.

### Install WordPress

Make a new project folder in our `Sites` directory and install WordPress in it.

```shell
mkdir /mnt/c/Sites/wordpress && cd /mnt/c/Sites/wordpress && wp core download
```

Create a `wp-config.php` file either manually or with the following command (replace your database user credentials as appropriate).

```shell
wp config create --dbname=wordpress_local --dbhost=localhost --dbuser=root --dbpass=yourpassword
```

Create a database.

```shell
wp db create
```

---

### Windows hosts file

We have to update the Windows hosts file so that we can type a URL into our browser and it knows to check our own computer for the server running that website.

Hit the Windows key, type `notepad`. Right-click on the Notepad program, then click `Run as administrator`.

![Open Notepad as administrator](assets/images/articles/run-notepad-as-admin.png)

Choose `File > Open`, then enter the following path into the Open dialog:

```text
C:\Windows\System32\drivers\etc\hosts
```

![Open Windows hosts file](assets/images/articles/open-windows-hosts.png)

Add the following line to the bottom of the file. Note, using `127.0.0.1` is important here; `localhost` will not work.

```text
# Windows Subsytem for Linux
127.0.0.1 wordpress.local
```

### Apache vhost

Back in your terminal, go to Apache's sites-available directory:

```shell
cd /etc/apache2/sites-available/
```

Duplicate and edit the default configuration file:

```shell
sudo cp 000-default.conf wordpress.local.conf&& sudo vim wordpress.local.conf
```

The only 2 fields we care about here are `ServerName`, which tells Apache what URL to listen for incoming requests from, and `DocumentRoot`, which tells Apache where to look for the website files when it gets a request on that server name.

Uncomment `ServerName` and edit both fields as necessary.:

```shell
ServerName wordpress.local
DocumentRoot /mnt/c/Sites/wordpress
```

![Apache VirtualHost config](assets/images/articles/apache-virtualhost-config.png)

Save and quit the file. Then, we need to tell Apache that we want it to load this configuration file by creating a symlink in the `sites-enabled` directory.

```shell
sudo ln -s /etc/apache2/sites-available/wordpress.local.conf /etc/apache2/sites-enabled/wordpress.local.conf
```
Reload Apache so the changes take effect.

```shell
sudo service apache2 reload
```

And check out the site at [http://wordpress.local](http://wordpress.local) in your browser, and you should be rewarded with the WordPress install screen.

![WordPress install screen](assets/images/articles/wordpress-install-screen.png)

---

## 6. Extra goodness

### Configure terminal in Visual Studio Code

Add the following to your vscode user settings, then  hit `Ctrl+\`` to launch a terminal session.

```javascript
"terminal.integrated.shell.windows": "C:\\Users\\Jason\\AppData\\Local\\Microsoft\\WindowsApps\\ubuntu.exe",
```

### Install phpmyadmin

I can't do any better than this article by Digital Ocean. https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-16-04
