# Install the Raspberry PI Imager on Ubuntu, Debian, Fedora and openSUSE - PragmaticLinux

By PragmaticLinux

Source: [https://www.pragmaticlinux.com/2021/08/install-the-raspberry-pi-imager-on-ubuntu-debian-fedora-and-opensuse/](https://www.pragmaticlinux.com/2021/08/install-the-raspberry-pi-imager-on-ubuntu-debian-fedora-and-opensuse/)

The relatively new Raspberry PI Imager application is great for downloading, configuring and writing the Raspberry PI operating system to your micro SD card. No more fiddling around with `dd` command-line parameters in the terminal. There is just one snag if you run Linux: the Raspberry PI Imager application is currently only packaged for Ubuntu. This article explains how you can install the Raspberry PI Imager on other Linux distributions as well, such as Debian, Fedora and openSUSE.

![Screenshot of the main window of the Raspberry PI Imager application.](https://www.pragmaticlinux.com/wp-content/uploads/2021/08/raspberry_pi_imager_main_window.png)

Screenshot of the main window of the Raspberry PI Imager application.

## Background

If you worked with a Raspberry PI before, you undoubtedly know how to install the Raspberry PI operating system. In fact, you probably completed the following steps several times already:

1.  Download the image of the Raspberry PI operating system to your PC.
2.  Plug the micro SD card into your PC.
3.  Write the Raspberry PI operating system image to the micro SD card.
4.  Insert the micro SD card into your Raspberry PI.
5.  Power up your Raspberry PI to boot the Raspberry PI operating system.

This article focuses on step 3, where you write the image of the operating system to the micro SD card. Several programs exists for achieving this step on Linux:

*   Directly in the terminal with the help of the `dd` program from the terminal.
*   Installing Balena Etcher to have a more user-friendly graphical user interface application.

You can find an example of using the `dd` program for this purpose in the article about [setting up your Raspberry PI 4 as a headless server](https://www.pragmaticlinux.com/2020/06/setup-your-raspberry-pi-4-as-a-headless-server/). Refer to the article about how to [perform a minimal install on your Raspberry PI](https://www.pragmaticlinux.com/2020/11/perform-a-minimal-install-on-your-raspberry-pi/) for an example that features Balena Etcher.

What you might not yet know is that the Raspberry PI foundation developed their own tool for this. It’s called the _Raspberry PI Imager_.

## Raspberry PI Imager introduction

The Raspberry PI Imager was first released in early 2020. It’s an easy-to-use graphical user interface application that ships with a few extra perks:

*   Through the user interface, you can select which operating system you want to install, and the Raspberry PI Imager will download it automatically for you.
*   With the Raspberry PI Imager you can restore the EEPROM bootloader on your Raspberry PI and configure the boot order.
*   It has a hidden advanced options screen (`Ctrl`+`Shift`+`x`) to preconfigure the Raspberry PI operating system. For example changing the default hostname, enabling SSH and configuring the WiFi network connection.

![Screenshot of various Raspberry PI Imager dialogs to offer an introductory overview.](https://www.pragmaticlinux.com/wp-content/uploads/2021/08/raspberry_pi_imager_overview.png)

Screenshot of various Raspberry PI Imager dialogs to offer an introductory overview.

I can highly recommend using the Raspberry PI Imager application for installing the operating system on the micro SD card of your Raspberry PI. Did I get you interested? Great! There is just one little snag: If you go to the Raspberry PI website to download it, you can only download it for Windows, macOS and Ubuntu. Well, wait a minute…what about the other popular Linux distributions such as Debian, Fedora and openSUSE? No worries. PragmaticLinux has your back. I spent the past few days packaging the Raspberry PI Imager software for Ubuntu, Debian, Fedora and openSUSE. The result is hosted on the openSUSE Open Build Service (OBS) infrastructure. In this article, I’ll explain in detail how to install the Raspberry PI Imager application on Ubuntu, Debian, Fedora and openSUSE.

## What do you need

To complete the steps in this article, you just need one thing: an Ubuntu, Debian, Fedora or openSUSE Linux system with your desktop environment of choice. While packaging up the Raspberry PI Imager software from the [rpi-imager source code repository on GitHub](https://github.com/raspberrypi/rpi-imager), I prepared VirtualBox virtual machines for all these Linux distributions. That way I could test the resulting DEB and RPM packages.

## openSUSE Open Build Services introduction

The nice folks over at openSUSE offer the Open Build Services infrastructure for free to developers and packagers of open source software for Linux. If software is missing from your Linux distribution’s online package repositories, you can package it into a DEB or RPM formatted archive and host it on openSUSE’s OBS platform. OBS of course supports openSUSE Leap and Tumbleweed. What not everyone knows or realizes is that you can build and host packages for other Linux distributions on OBS as well.

## Locating the Raspberry PI Imager application on OBS

To locate the Raspberry PI Imager packages on PragmaticLinux’s OBS account, visit the OBS website at [https://build.opensuse.org/](https://build.opensuse.org/) and enter `rpi-imager` in the search box. In the search results, you can see a link to [home:pragmalin / rpi-imager](https://build.opensuse.org/package/show/home:pragmalin/rpi-imager):

![Web browser screenshot that shows how to find the Raspberry PI Imager (rpi-imager) on openSUSE OBS.](https://www.pragmaticlinux.com/wp-content/uploads/2021/08/find_rpi_imager_on_obs.png)

Web browser screenshot that shows how to find the Raspberry PI Imager (rpi-imager) on openSUSE OBS.

On the `rpi-imager` project page of PragmaticLinux’s OBS account, you can find a link called _Download package_. Following this link, gives you access to the DEB and RPM packages of the Raspberry PI Imager application.

![Web browser screenshot of the rpi-imager project on PragmaticLinux's OBS account. It highlights the "Download package" link.](https://www.pragmaticlinux.com/wp-content/uploads/2021/08/rpi_imager_project_page_on_obs.png)

Web browser screenshot of the rpi-imager project on PragmaticLinux's OBS account. It highlights the "Download package" link.

On the next screen you can see an overview of the Linux distributions for which the `rpi-imager` package is available:

![Screenshot that shows how to access the Linux distribution specific installation instructions for the Raspberry PI Imager application.](https://www.pragmaticlinux.com/wp-content/uploads/2021/08/rpi_imager_obs_linux_distro_selection.png)

Screenshot that shows how to access the Linux distribution specific installation instructions for the Raspberry PI Imager application.

The next sections describe in detail how to install package `rpi-imager` of the Raspberry PI Imager application for Ubuntu, Debian, Fedora and openSUSE. It’s important to note though, that two options exist for the package installation:

1.  Download the DEB or RPM package file for your distribution and install it from the downloaded file, using your package manager. For example `apt`, `dnf` or `zypper`.
2.  Register the online package repository of the `home:pragmalin` OBS project with your package manager and then install it directly from the OBS online package repository.

Both options work of course. Personally, I prefer option number two. Simply because then you also get fixes and new versions, when updating the software packages on your Linux system. For this reason, the following sections focus on option two.

Now that you know how to find the `rpi-imager` package on PragmaticLinux’s OBS account, click the _Ubuntu_ icon. Followed by clicking the _Add repository and install manually_ link. It shows you the instructions for registering the repository of the `home:pragmalin` OBS project on your Ubuntu system. Including the commands from installing the `rpi-imager` package afterwards. For Ubuntu 20.04, the commands are:

*   `echo 'deb http://download.opensuse.org/repositories/home:/pragmalin/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:pragmalin.list`
*   `curl -fsSL https://download.opensuse.org/repositories/home:pragmalin/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_pragmalin.gpg > /dev/null`
*   `sudo apt update`
*   `sudo apt install rpi-imager`

![Screenshot that shows the installation instructions for the Raspberry PI Imager (rpi-imager) on Ubuntu.](https://www.pragmaticlinux.com/wp-content/uploads/2021/08/install_rpi_imager_ubuntu.png)

Screenshot that shows the installation instructions for the Raspberry PI Imager (rpi-imager) on Ubuntu.

Go ahead and run these commands in the terminal to install package `rpi-imager` of the Raspberry PI Imager application on your Ubuntu 20.04 system.

## Install the Raspberry PI Imager on Debian

Since Ubuntu and Debian both use the DEB package file format, the instructions are quite similar for Debian. This time click on the Debian icon to display the instructions to add the repository of the `home:pragmalin` OBS project and then install the `rpi-imager` package. For Debian 11, the commands are:

*   `echo 'deb http://download.opensuse.org/repositories/home:/pragmalin/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/home:pragmalin.list`
*   `curl -fsSL https://download.opensuse.org/repositories/home:pragmalin/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_pragmalin.gpg > /dev/null`
*   `sudo apt update`
*   `sudo apt install rpi-imager`

![Screenshot that shows the installation instructions for the Raspberry PI Imager (rpi-imager) on Debian.](https://www.pragmaticlinux.com/wp-content/uploads/2021/08/install_rpi_imager_debian.png)

Screenshot that shows the installation instructions for the Raspberry PI Imager (rpi-imager) on Debian.

Run these four commands from the terminal, to install the Raspberry PI Imager application on your Debian 10 system.

## Install the Raspberry PI Imager on Fedora

You can follow a similar procedure for installing the Raspberry PI Imager on Fedora. So click the Fedora icon, followed by a click on the _Add repository and install manually_ link. On Fedora, you only need to run two commands to adding the repository and installing package `rpi-imager`. Example for Fedora 37:

*   `sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:pragmalin/Fedora_38/home:pragmalin.repo`
*   `sudo dnf install rpi-imager`

![Screenshot that shows the installation instructions for the Raspberry PI Imager (rpi-imager) on Fedora.](https://www.pragmaticlinux.com/wp-content/uploads/2021/08/install_rpi_imager_fedora.png)

Screenshot that shows the installation instructions for the Raspberry PI Imager (rpi-imager) on Fedora.

Just note that the instructions state that the commands need to run as root. For this reason, you should add `sudo` to the start of the commands.

## Install the Raspberry PI Imager on openSUSE

By now, you probably get the idea and you can probably figure out how to install the Raspberry PI Imager on openSUSE as well. Just bear in mind that openSUSE offers two flavors of their distribution:

*   A fixed release cycle distribution called openSUSE Leap.
*   A true rolling release distribution called openSUSE Tumbleweed.

When installing the Raspberry PI Imager on openSUSE, you just need to make sure you pick the instructions for the right one. Example for openSUSE Leap 15.4:

*   `sudo zypper addrepo https://download.opensuse.org/repositories/home:pragmalin/15.5/home:pragmalin.repo`
*   `sudo zypper refresh`
*   `sudo zypper install rpi-imager`

![Screenshot that shows the installation instructions for the Raspberry PI Imager (rpi-imager) on openSUSE.](https://www.pragmaticlinux.com/wp-content/uploads/2021/08/install_rpi_imager_opensuse.png)

Screenshot that shows the installation instructions for the Raspberry PI Imager (rpi-imager) on openSUSE.

Keep in mind that the instructions state that the commands need to run as root. Therefore add `sudo` to the start of the commands.

## Running the Raspberry PI Imager application

At this point, you completed the installation of the Raspberry PI Imager application onto your Linux system. The installation also created a desktop launcher for you. It’s in file `/usr/share/applications/rpi-imager.desktop`. This means that you can conveniently locate and run the Raspberry PI Imager application, using the application’s menu of your desktop environment.

Most desktop environments offer a search feature for the application menu. To locate the Raspberry PI Imager application, enter the search text `rpi` or `imager`. Once located you can start the Raspberry PI Imager application:

![Screenshot of how to locate the Raspberry PI Imager application on the GNOME desktop environment.](https://www.pragmaticlinux.com/wp-content/uploads/2021/08/run_raspberry_pi_imager.png)

Screenshot of how to locate the Raspberry PI Imager application on the GNOME desktop environment.

## Wrap up

With the Raspberry PI Imager application you can quickly and easily write an operating system image to the micro SD card for your Raspberry PI. The Raspberry PI Imager comes with a few extra benefits compared to other solutions:

*   The Raspberry PI Imager application automatically downloads the operating system image for you. You merely need to select the one you want.
*   With the Raspberry PI Imager you can restore the EEPROM bootloader on your Raspberry PI and configure the boot order.
*   It has a hidden advanced options screen (`Ctrl`+`Shift`+`x`) to preconfigure the Raspberry PI operating system. For example changing the default hostname, enabling SSH and configuring the WiFi network connection.

This article introduced the Raspberry PI Imager application and specifically focused on how to install it onto your Linux system. At this point the Raspberry PI foundation only offers a package for Ubuntu. To make the Raspberry PI Imager software available to other popular Linux distributions, I packaged it and hosted the resulting DEB and RPM packages on the openSUSE OBS infrastructure. You can find it in [PragmaticLinux’s account on OBS](https://build.opensuse.org/project/show/home:pragmalin).

In a future article I plan on writing a tutorial on how to actually use the Raspberry PI Imager application. So keep your eye on the PragmaticLinux blog or, better yet, subscribe to the weekly newsletter to stay informed about new article releases. You can find the newsletter subscription sign-up box in the sidebar, towards the top of this page.
