---
title: Automatically launch a headless VirtualBox VM at bootup
date: 2015-07-14 21:49 CDT
date_updated:
article_summary: Since I mostly develop on a CentOS VM on a Windows box, so this is how to launch it automatically and silently.
---

![placeholder](http://placehold.it/1140x334)

## Virtual machine for development

While I dual boot Windows 10 Tech Preview (it's amazing, by the way) and Linux Mint on my laptop, my primary workstations are currently Windows 8.1. Thus, my workflow for web development involves a CentOS virtual machine running in Virtual Box.

I run a LEMP stack for WordPress and Magento, rbenv to manage several versions of Ruby, nvm to manage several versions of Nodejs, and so forth.

One complaint about my workflow is that I can't run `subl .` to open the current directory in Sublime. Rather, I setup a Samba share and connect with that, which works well.

## Launch VM on startup

Anyway, since I am basically SSHd into this VM all day, I wanted it to automatically boot . More importantly, I wanted this to happen in the background to avoid having a VirtualBox window open in my taskbar.

### 1. Go to startup folder

Navigate to `C:\Users\*username*\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup` (note, choose your own user). Any files or shortcuts here will be run when Windows loads your user account.

### 2. Create new text file

Create a *text* file, then rename it to `Whatever-you-want.bat`. Make sure the file type changes to a `bat` file.

Open the file in `Notepad` and put this inside:

```bat
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "NameOfYourVM" --type "headless"
```

Note, put the name of your virtual machine in the double quotes.
