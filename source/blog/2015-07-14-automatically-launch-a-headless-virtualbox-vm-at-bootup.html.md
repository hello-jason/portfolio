---
title: Automatically launch a headless VirtualBox VM on Windows bootup
hero_image: headless-virtualbox-vm.jpg
hero_alt: Headless VirtualBox vm bat file
date: 2015-07-14 21:49 CDT
date_updated:
article_summary: I mostly develop on a CentOS VM on a Windows box, so this is how to launch it automatically and silently.
---

## Virtual machine for development

While I dual boot Windows 10 Tech Preview (it's amazing, by the way) and Linux Mint on my laptop, my primary workstations are desktops on Windows 8.1. Thus, my workflow for web development involves a CentOS virtual machine running in Virtual Box. I run a <abbr title="Linux, Nginx, MariaDB, PHP">LEMP</abbr> stack for WordPress and Magento, rbenv to manage several versions of Ruby, nvm to manage several versions of Nodejs, and so forth.

One complaint about my workflow is that I can't run `subl .` to open the current directory in Sublime Text 3. Rather, I setup a Samba share and connect with files, which works well.

## Launch VM on startup

Anyway, since I'm basically SSHd into this VM all day, I wanted it to automatically boot when the computer itself booted up. More importantly, I wanted this to happen in the background to avoid having to visit VirtualBox's GUI each time&mdash;at least version 5 finally introduces startup options in a dropdown menu rather than knowing to secretly shift+click for a headless launch, but I want automation.

### 1. Go to startup folder

Navigate to `C:\Users\username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup` (note, choose your own user). Any files or shortcuts here will be run when Windows loads your user account.

### 2. Create new text file

Create a *text* file within the `Startup` directory (step 1 above), then rename the file to `Whatever-you-want.bat`. Maybe  you'll want to make it the name of your VM, but ensure the file type changes to a `.bat` file.

### 3. Edit bat file

Open the `.bat` file in `Notepad` and put this inside:

```bat
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "NameOfYourVM" --type "headless"
```

Note, put the name of your virtual machine in the double quotes.

## What happens?

If this is done correctly, a command prompt window will display for a few moments during Windows' initial startup sequence. Then, it will disappear and you can access your virtual machine as normal.
