---
title: WSL2 Complete GUI Setup
description: Guia completo para configurar interface gráfica no WSL2
category: wsl
tags: [wsl2, gui, graphical-interface, setup, linux]
---

# The complete WSL2 + GUI setup. | Medium

By Japheth Yates

Source: [https://medium.com/@japheth.yates/the-complete-wsl2-gui-setup-2582828f4577](https://medium.com/@japheth.yates/the-complete-wsl2-gui-setup-2582828f4577)

## Installing WSL2

Let’s jump right in! Firstly, we need to install WSL and set WSL2 to be the default. You will need to open a PowerShell as _administrator_ and then copy, paste, and run each command below. The commands must be executed separately by pressing the _Enter/Return_ key in the PowerShell after each paste operation. The official Microsoft instructions can be found [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestartdism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

You will need to restart your system before proceeding with the next step

```
wsl --set-default-version 2
```

You should now have WSL2 installed and set up on your system.

## Installing a Linux Distribution

Now let’s get you a Linux distribution. You can see what is available by going to the Microsoft Store and searching for “Linux”. I’d recommend starting with [Ubuntu](https://ubuntu.com/). If you want to install another distribution please go ahead but I’ll be using an Ubuntu installation here and some later steps may not apply to another Linux distribution.

Select Ubuntu from the Microsoft Store and click on “Install” which will install Ubuntu 20.04 LTS on your Windows 10 system.

Now find the Ubuntu icon in the “recently added” applications or just press the Windows button and search for Ubuntu. Click on the icon and you will be taken to a terminal/command line window where the installation will finish. This process will take a few minutes and you will be required to provide a username and password. Once finished you’ll end up within Ubuntu’s command-line interface (terminal). Congratulations, you’ve just successfully installed Ubuntu Linux on your Windows 10 system. Really?! That easy?!!!

## Updating Ubuntu

You now have a running version of Ubuntu on your Windows system! So let’s make sure everything is updated. Copy the command below into your terminal and press the _Return_ key. Note that you will be asked to enter your password. The _sudo_ (superuser do) prefix runs the command with high-security/administrator privileges.

```
sudo apt update && sudo apt -y upgrade
```

It may take a few minutes to install all the updates depending on your internet connection speed.

![]()

Ubuntu Linux terminal in Windows 10

Your system should now be updated and you can now install any Linux software you want using the _sudo apt install name\_of\_software_ command. I’d recommend installing some networking tools along with some essential compilers using (you may be asked to confirm installation by typing the letter _Y_ in the terminal). Also, let’s install some remote desktop utilities so that you can use remote desktop to connect to your Linux distribution if you want.

```
sudo apt install build-essentialsudo apt install net-toolssudo apt install xrdp -y && sudo systemctl enable xrdp
```

## Setting up the GUI

WSL2 does not currently support graphical user interfaces but we can get around that by telling Ubuntu to use an X-server on Windows. Let us start by installing a desktop environment. Some desktop environments (e.g. gnome 3) can run in WSL2 but they run with errors and I wouldn’t recommend them. Instead, we will install a lightweight desktop along with some of its requirements. There are two lightweight options for Ubuntu that I’ve tested: _mate _or _xfce4_. We’ll install xfce4 by installing the _xubuntu-desktop _and then some _gtk2 _libraries but feel free to install the _ubuntu-mate-desktop_ if you prefer.

```
sudo apt install -y taskselsudo tasksel install xubuntu-desktopsudo apt install gtk2-engines
```

A colored window will appear and install the xfce4-desktop which could take some minutes.

We now need to export a few variables to let Linux know where to look for the X-server on Windows. Copy the following and run the following in your terminal

```
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0export LIBGL_ALWAYS_INDIRECT=1sudo /etc/init.d/dbus start &> /dev/null
```

If you don’t want to type these every time you open your Linux distribution you should copy and paste these commands at the end of the _.bashrc_ file in your home directory. You can use the [nano](https://www.nano-editor.org/dist/latest/cheatsheet.html) or [vim](https://devhints.io/vim) editors to open the .bashrc file using

```
vim ~/.bashrc
```

or

```
nano ~/.bashrc
```

You can also create a file called _/etc/sudoers.d/dbus_ and add the following in it using your username

```
your_user_name ALL = (root) NOPASSWD: /etc/init.d/dbus
```

This does come with risks but it should be ok for most. You can read _/etc/sudoers.d/README_ for more information. You’ll need to use the sudo prefix to create the _dbus _file as well as to read the _README_.

This pretty much fully sets up your Linux distribution. So let’s get the Windows part set and then you’ll be finished.

## Setting up X-server on Windows 10

I’ve tested two Windows X-servers: [VcXsrv](https://sourceforge.net/projects/vcxsrv/) (free) and [x410](https://x410.dev/) (paid on Windows Store). I’ve not found much difference in terms of performance so I’d have to recommend VcXsrv for most users. I got a hold of x410 on sale and it is more stable than VcXsrv but this doesn’t mean that the latter is unstable. The x410 website has [detailed guides](https://x410.dev/cookbook/wsl/using-x410-with-wsl2/) on how to get started with Linux WSL2 GUI apps so I won’t be going through it here. I’ll just focus on VcXsrv.

Download, install, and launch [VcXsrv](https://sourceforge.net/projects/vcxsrv/). You’ll be given a choice of four display window options. Let’s choose ‘Multiple windows’ for now and press next.

![]()

VcXsrv first setup option

On the next screen, you can leave everything as default.

![]()

VcXsrv second setup option

On the next window, make sure that all options are checked including ‘Disable access control’ then press next, save the configuration if you want and finish.

![]()

VcXsrv third setup option

You will then probably be asked if you want to allow VcXsrv to access your network, you’ll have to click on the ‘Public network’ option here and allow it through the Windows Firewall or whichever firewall you use.

Now jump back into your Linux terminal. Once in there, and assuming you’ve followed all the steps above, you should be able to run GUI apps by typing their name in the terminal and pressing _Enter_. For example to run Firefox (if you’ve followed all steps above Firefox will be installed), simply go into your Linux terminal and write

```
firefox &
```

The ‘&’ after the application name runs it in the background so you can still use the terminal. If you choose not to run applications in the background you’ll have to open a new terminal if you want to do other tasks in your Linux operating system. If Firefox isn’t installed, you can install it using _sudo apt install firefox_.

## Full Linux Desktop

To run a complete Linux desktop, you’ll need to change the display settings in VcXsrv. You can either select ‘One large window’ or ‘Full screen’, but I would recommend starting with the former. Then follow the same steps described above and jump into your Linux terminal and use the following command:

```
xfce4-session
```

This launches the _xfce4_ desktop installed earlier and you’ll have access to a working Linux desktop. There will be some errors in the terminal and there will always be a popup in the desktop, just cancel it and use the desktop as you please. Congratulation!!!

Below is a screenshot of my setup. I’ve installed a few other applications along with changing the [theme](https://www.xfce-look.org/p/1190851/) and [icons](https://www.xfce-look.org/p/1166289/) so yours may look a little different.

I’ll remind you again that GUI applications aren’t supported yet so there may be glitches and errors from time-to-time but I’ve not experienced anything catastrophic yet.

## Conclusion

Now you’re free to go and customize Ubuntu and the terminal as you like. I’m a big fan of O[hMyZsh](https://github.com/ohmyzsh/ohmyzsh) and the [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme. You can see it below on the Windows terminal running Ubuntu. If you decide to leave the bash shell (default in Ubuntu) and go to OhMyZsh and the zshell just take care to back up your _.bashrc_ file __before __you install zshell. You will need to copy the changes we made above to your new _.zshrc_ file.

There are so many cool things you can do with Linux and it is by far the most customizable operating system out there. With time Linux will become more and more usable within Microsoft so watch this space! Enjoy using your new setup and if you’re trying Linux for the first time — Welcome!
