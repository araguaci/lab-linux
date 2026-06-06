---
title: Asterisk Raspberry Pi
description: Guia para instalação e configuração de Asterisk no Raspberry Pi
category: raspberry-pi
tags: [asterisk, voip, pbx, raspberry-pi, telephony]
---

# How to Install Asterisk on a Raspberry Pi?

By Patrick Fromaget

Source: [https://raspberrytips.com/install-asterisk-on-raspberry-pi/](https://raspberrytips.com/install-asterisk-on-raspberry-pi/)

If you click our links and make a purchase, we may earn an affiliate commission. [Learn more](https://raspberrytips.com/privacy-policy/#afflinks)

Asterisk is a free and open source PBX to manage your calls automatically (perfect for a small business). In this tutorial, I’ll show you how to install it on Raspberry Pi.

__Asterisk is available from the package manager on Raspberry Pi OS, but the latest version can be installed by compiling from the source code provided by Asterisk.org.__

The official website gives you the full documentation for everything, but in this post, I’ll give you a short guide tailored for your Raspberry Pi. Let’s get started.

If you’re new to Raspberry Pi or Linux, I’ve got something that can help you right away!\
[Download my free Linux commands cheat sheet](https://raspberrytips.com/downloads/?source=begpost\&lm=2) – it’s a quick reference guide with all the essential commands you’ll need to get things done on your Raspberry Pi. [__Click here to get it for free!__](https://raspberrytips.com/downloads/?source=begpost\&lm=2)

__Want the best experience?__ [Become a premium member](https://raspberrytips.com/school/community/?utm_source=website\&utm_medium=post\&utm_campaign=experience) for ad-free browsing, access exclusive content, and ask questions in our private forums. Your membership helps support the site!

## Prerequisites

*   __Raspberry Pi__: if possible, a [Raspberry Pi 4](https://raspberrytips.com/raspberry-pi-gear/) or [Pi 5](https://raspberrytips.com/amz/pi5). The compilation takes a long time on an older model, and more power can be useful depending on what you’ll do with it.
*   __Raspberry Pi OS__: if you don’t have it installed yet. The [Lite version](https://raspberrytips.com/raspberry-pi-os-lite-vs-desktop) is fine, as there is no graphical interface for Asterisk. ([download here](https://www.raspberrypi.org/downloads/)).
*   __SD card__: Asterisk doesn’t require much space. [Here’s my favorite SD card currently.](https://raspberrytips.com/amz/sd)

## Installing Asterisk

![asterisk logo](https://raspberrytips.com/wp-content/uploads/2020/06/logo_asterisk.jpg)

asterisk logo

Here’s an overview of the steps to install Asterisk on a Raspberry Pi:

*   __Install and update Raspberry Pi OS.__
*   __Download Asterisk from the official GitHub__.
*   __Compile the source code and install Asterisk__.
*   __Configure Asterisk using the default configuration files__.

I’ll explain each step in the sections below.

### Raspberry Pi OS Installation

If you’re using a new SD card for Asterisk, you firstly need to install Raspberry Pi OS on it. As I mentioned, the Lite version is perfect. If you need a step-by-step tutorial on how to do this, you can [check this one out.](https://raspberrytips.com/install-raspbian-raspberry-pi/).

Once done, don’t forget to enable [SSH](https://raspberrytips.com/glossary/ssh/) and update your system before going further:\
`sudo apt update
sudo apt upgrade`

As I will give you many commands to install and configure Asterisk, it’s better to copy and paste them from your computer directly.

### Download Asterisk

__Note__: _Asterisk is available in the Raspberry Pi OS [repository](https://raspberrytips.com/glossary/repository/) (sudo apt install asterisk), but it’s an older version. It’s OK for a quick try, but I recommend using the latest version in production._

__All Asterisk downloads are available [on this page](https://www.asterisk.org/downloads).__

You’ll have to scroll down to get to what we want. The first link is for FreePBX, a [GUI](https://raspberrytips.com/glossary/gui/) interface to manage Asterisk, but it doesn’t support the Pi. Next is a sponsored offer for PBXact Cloud, which isn’t what we’re looking for either.

__Finally, you’ll scroll down to the “Source Code” section, which is what you’ll want.__

I’ll be showing you how to download the latest version using git. This way, you’ll always get the latest version. Here’s how:

*   __Install git:__`sudo apt install git`
*   __Change to the /usr/local/src directory__, where we’ll build it:\
    `cd /usr/local/src`
*   __Download the git repository files__:\
    `sudo git clone https://github.com/asterisk/asterisk`

If you were wondering about the instructions involving DAHDI and LIBPRI, you won’t need them. DAHDI manages interface cards (and includes many drivers) that you’re probably not using on a Pi. LIBPRI is also not required, as it’s for ISDN interfaces.

Since most of us will be using Asterisk as an IPBX with SIP and Internet, we won’t install these extra packages.

Are you a bit lost in the Linux command line? [Check this article first](https://raspberrytips.com/raspberry-pi-commands/) for the most important commands to remember and a free downloadable cheat sheet so you can have the commands at your fingertips.

### Install Asterisk

If you’d prefer to follow along as you install, watch our video below:

As for most software built from source, the first step is to check that you have all the requirements for Asterisk installed:

*   __Go to the asterisk folder:__`cd /usr/local/src/asterisk`

*   __Install the prerequisites:__`sudo apt install libedit-dev sqlite3 libsqlite3-dev libjansson-dev libxml2-dev uuid-dev`

*   __Run the configure script__ to check that you have all the requirements installed:\
    `sudo ./configure`\
    If there is any error, there is probably a package missing on your system.\
    Use “apt search” to find the corresponding package and install it (feel free to leave a comment [in the community](https://raspberrytips.com/community) if you find a package missing from my previous command).

*   Then,__ choose the features you want to use__:\
    `sudo make menuselect`

    A menu like this should appear:\
    ![](https://raspberrytips.com/wp-content/uploads/2020/06/menuselect.jpg)\
    __Verify in each submenu that everything you need is checked.__Press SPACE to select/unselect options you want. Some options are unavailable if the corresponding package is not installed.\
    ![](https://raspberrytips.com/wp-content/uploads/2020/06/menuselect2.jpg)\
    If you don’t really know what you need yet, you can leave it as the default configuration.\
    Once you’re done, __Press ESC and S to save and exit.__

*   __You can now run make__ to compile Asterisk:\
    `sudo make`\
    It may take more or less time depending on your Raspberry Pi model and the features you chose (about 15-20 minutes on a [Pi 4](https://raspberrytips.com/amz/pi4) with the default configuration).

*   Finally, __install all files__:\
    `sudo make install`

That’s it, then you have a few commands that are not mandatory but recommended if you are new on Asterisk:

*   __Install sample files:__`sudo make samples
    `The goal here is to start with a default configuration.\
    It will create all the files in the Asterisk folder for you (with many comments in it), so you don’t start from scratch.
*   __Install initialization scripts:__`sudo make config
    `I recommend doing this, as it will add an initscript, to automatically start Asterisk on boot.\
    It’s also useful to start or stop the server if needed.
*   __Enable log rotation:__`sudo make install-logrotate
    `As we are on Raspberry Pi (so small disk space in general), it’s probably a good idea to do this.\
    It will install a script that manages the log files.

The installation is done, and you can continue with the configuration part.

### Asterisk Service

Just in case you need it (probably), here are the commands you can use if you installed the initialization script:

*   __Start Asterisk:__`sudo /etc/init.d/asterisk start`
*   __Stop Asterisk:__`sudo /etc/init.d/asterisk stop`
*   __Check the status:__`sudo /etc/init.d/asterisk status`

I recommend checking the status before going further (and start the service if needed).\
If it doesn’t work at this point with the default configuration, it’ll probably not work after your changes 🙂

If you don’t have the initialization script, you can start asterisk with:\
`sudo asterisk -gcv`

Asterisk stops when you close your window or SSH connection (you can use a screen to keep it running in background).

## Configuring Asterisk

Now that you’ve installed Asterisk, it’s time to configure the program to fit your needs.

### Files Location

__The configuration files for Asterisk are located in /etc/asterisk.__ There are many files here (119 in my test), so it’s difficult to explain in a few lines, but I’ll cover the more important ones later.

Just a quick note here: if you want to use or upload sounds in your configuration, they are located under /var/lib/asterisk/sounds. By default, you’ll get only sounds in English, but many languages are available in _menuselect_ if you need another one.

### Main Configuration Files

As I’ve mentioned, you don’t need all the configuration files. Here are the more important ones and what they do:

*   __sip.conf__: In this file, you need to configure your SIP accounts. SIP is a protocol to manage calls over the Internet. You need to find a provider (some are available for free like [LinPhone](https://www.linphone.org/freesip/home)), and check with them on how to configure their service for Asterisk.
*   __users.conf__: Each user (=phone or softphone) also needs to be configured. If you use a softphone on your computer, you need to define the SIP account in this file (number and password at least). Check the file sample for an example.\
    Asterisk is compatible with any SIP phone. [I have used a lot of this brand in the past](https://www.amazon.com/dp/B076WVZY2P) with great results if you are looking for one.
*   __extensions.conf__: This file is like Asterisk’s brain. Editing this file lets you manage what should happen when you receive or make a call. You can have a simple configuration that just makes your phone ring when someone calls.\
    Or you can do something more complicated, with opening hours, a welcome message, or ring several phones. It’s probably the most complicated file to understand when you’re start out.

Basically, you don’t need to edit the other files if all you want is a basic configuration.

### Going Further

I will not explain in detail all the configurations possible here. But you’ll find some more information on these sites:

*   [Asterisk official wiki](https://wiki.asterisk.org/)
*   [Voip-info.org](https://www.voip-info.org/asterisk/)

And you’ll also find help on other websites and forums because Asterisk is a well-known product with lots of users all over the world.

__Want to chat with other Raspberry Pi enthusiasts?__ [Join the community](https://raspberrytips.com/community), share your current projects and ask for help directly in the forums.

__You may also like:__

*   [57 Raspberry Pi commands you need to know](https://raspberrytips.com/raspberry-pi-commands/?related)
*   [Auto start any program when the Raspberry Pi boots up](https://raspberrytips.com/autostart-a-program-on-boot/?related)
*   [Remote access your Pi from anywhere (best apps)](https://raspberrytips.com/remote-desktop-raspberry-pi/?related)
*   [Create an image of your SD card (safety first!)](https://raspberrytips.com/create-image-sd-card/?related)
*   [Master Raspberry Pi in 30 days with this](https://raspberrytips.com/book-link)

## Conclusion

That’s it! You now know how to install Asterisk on a Raspberry Pi. It seems to work correctly on a Pi 4, so it could be great for use at home or in a small business.

I’ve been using Asterisk at work for years, with 70 people answering calls for our customer service. The load average stays very low, even with that number of simultaneous calls. Once you overcome the learning curve, it’s powerful and not so complicated.

__Whenever you’re ready, here are other ways I can help you:__

__[The RaspberryTips Community](https://rpitips.com/bcommunity)__: If you want to hang out with me and other Raspberry Pi fans, you can join the community. I share exclusive tutorials and behind-the-scenes content there. Premium members can also visit the website without ads.

__[Master your Raspberry Pi in 30 days](https://rpitips.com/bbook)__: If you are looking for the best tips to become an expert on Raspberry Pi, this book is for you. Learn useful Linux skills and practice multiple projects with step-by-step guides.

__[The Raspberry Pi Bootcamp](https://rpitips.com/bcourse)__: Understand everything about the Raspberry Pi, stop searching for help all the time, and finally enjoy completing your projects.

__[Master Python on Raspberry Pi](https://rpitips.com/bpython)__: Create, understand, and improve any Python script for your Raspberry Pi. Learn the essentials step-by-step without losing time understanding useless concepts.

You can also find all my recommendations for tools and hardware [on this page](https://raspberrytips.com/resources/?e=1).

![](https://secure.gravatar.com/avatar/0d24096f9ab9984fa926b784607e88bc?s=80\&d=mm\&r=g)

I'm the lead author and owner of RaspberryTips.com.\
My goal is to help you with your Raspberry Pi problems using detailed guides and tutorials.\
In real life, I'm a Linux system administrator with web developer experience.
