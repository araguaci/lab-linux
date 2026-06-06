
---
title: Ubuntu 22.04 WSL
description: Guia para instalar Ubuntu 22.04 no WSL
category: wsl
tags: [ubuntu, wsl, 22.04, installation, linux]
---

[](https://cloud-images.ubuntu.com/)

* * *

Ubuntu Cloud Images
===================

Ubuntu Cloud Images are the official Ubuntu images that have been customised by Canonical to run on [public clouds](https://cloud-images.ubuntu.com/locator/) that provide Ubuntu Certified Images, Openstack, LXD and more.

![Icon ](/icons/blank.gif) [Name](?C=N;O=D)                    [Last modified](?C=M;O=A)      [Size](?C=S;O=A)  [Description](?C=D;O=A)

* * *

![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [bionic/](https://cloud-images.ubuntu.com/bionic/)                 2023-06-07 18:10    -   Ubuntu Server 18.04 LTS (https://cloud-images.ubuntu.com/Bionic Beaver) daily builds
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [daily/](https://cloud-images.ubuntu.com/daily/)                  2025-03-20 19:43    -   Daily image builds
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [docs/](https://cloud-images.ubuntu.com/docs/)                   2020-10-09 17:36    -   
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [focal/](https://cloud-images.ubuntu.com/focal/)                  2025-04-03 12:30    -   Ubuntu Server 20.04 LTS (https://cloud-images.ubuntu.com/Focal Fossa) daily builds
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [jammy/](https://cloud-images.ubuntu.com/jammy/)                  2025-03-27 18:32    -   Ubuntu Server 22.04 LTS (https://cloud-images.ubuntu.com/Jammy Jellyfish) daily builds
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [locator/](https://cloud-images.ubuntu.com/locator/)                2025-04-14 12:23    -   Image Locator
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [minimal/](https://cloud-images.ubuntu.com/minimal/)                2024-03-19 23:34    -   Ubuntu Server minimized image builds
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [noble/](https://cloud-images.ubuntu.com/noble/)                  2025-04-03 19:48    -   Ubuntu Server 24.04 LTS (https://cloud-images.ubuntu.com/Noble Numbat) daily builds
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [oci/](https://cloud-images.ubuntu.com/oci/)                    2024-06-06 08:15    -   
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [oracular/](https://cloud-images.ubuntu.com/oracular/)               2025-03-07 00:10    -   Ubuntu Server 24.10 (https://cloud-images.ubuntu.com/Oracular Oriole) daily builds
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [plucky/](https://cloud-images.ubuntu.com/plucky/)                 2025-03-30 00:45    -   
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [releases/](https://cloud-images.ubuntu.com/releases/)               2025-03-05 16:26    -   Release image builds
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [server/](https://cloud-images.ubuntu.com/server/)                 2025-04-14 14:03    -   Ubuntu Server Cloud Image Builds
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [trusty/](https://cloud-images.ubuntu.com/trusty/)                 2022-07-28 10:52    -   Ubuntu Server 14.04 LTS (https://cloud-images.ubuntu.com/Trusty Tahr) daily builds \[END OF STANDARD SUPPORT\]
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [vagrant/](https://cloud-images.ubuntu.com/vagrant/)                2017-01-25 14:48    -   Vagrant images
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [wsl/](https://cloud-images.ubuntu.com/wsl/)                    2025-03-27 18:43    -   
![[DIR]](https://cloud-images.ubuntu.com/cdicons/folder.png) [xenial/](https://cloud-images.ubuntu.com/xenial/)                 2023-03-14 09:53    -   Ubuntu Server 16.04 LTS (Xenial Xerus) daily builds

* * *

Ubuntu in the cloud
-------------------

#### [![Amazon Web Services logo](https://assets.ubuntu.com/v1/a82add58-profile-aws.svg)](https://cloud-images.ubuntu.com/locator/ec2/)

Amazon Web Services offers reliable, scalable, and inexpensive cloud computing services.

*   [Ubuntu’s guide to using EC2](https://ubuntu.com/server/docs/cloud-images/amazon-ec2)
*   [Launch Ubuntu Pro for AWS](https://ubuntu.com/aws/pro)
*   [Ubuntu images on Amazon](https://aws.amazon.com/marketplace/search/results?searchTerms=canonical)
*   [Ubuntu EKS Images ›](/docs/aws/eks/)

#### [![Microsoft Azure logo](https://assets.ubuntu.com/v1/22fd6473-MicrosoftAzure_logo.svg)](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/Canonical.UbuntuServer)

Microsoft Azure is an open, flexible, enterprise-grade cloud computing platform.

*   [Guide to using Microsoft Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/)
*   [Launch Ubuntu Pro for Azure](https://ubuntu.com/azure/pro)
*   [Ubuntu images on Azure](https://azuremarketplace.microsoft.com/en-us/marketplace/apps?search=canonical%20ubuntu&page=1&filters=virtual-machine-images)

#### [![Google Cloud Platform logo](https://assets.ubuntu.com/v1/e795fc84-Google_Cloud_Logo.svg)](https://console.cloud.google.com/launcher/browse?q=ubuntu&filter=category:os&filter=price:free)

Google Cloud Platform lets you build and host applications and websites, store data, and analyze data on Google’s scalable infrastructure.

*   [Get started on GCP](https://cloud.google.com/getting-started/)
*   [Start launching instances on GCP](https://console.cloud.google.com/projectselector/compute/instances)
*   [Ubuntu images on GCE](https://console.cloud.google.com/marketplace/browse?authuser=0&orgonly=true&organizationId=888541318771&supportedpurview=project&q=canonical%20ubuntu)

For more information, please see the following:

*   [Ubuntu on public clouds](https://ubuntu.com/download/cloud)
*   [Commercial Support with Ubuntu Pro](https://ubuntu.com/pro)
*   [Cloud Images documentation](https://ubuntu.com/server/docs/cloud-images/introduction)

Cloud image specific bugs should be filed in the [cloud-images](https://bugs.launchpad.net/cloud-images/+filebug) project on Launchpad.net.

* * *

© Canonical Ltd. Ubuntu and Canonical are registered trademarks of Canonical Ltd.

[Legal information](https://www.ubuntu.com/legal)

[Go to the top of the page](#)

# Import Ubuntu22.04 to WSL or WSL2

By Lukas Magauer

Source: [https://docs.rockylinux.org/guides/interoperability/import\_rocky\_to\_wsl/](https://docs.rockylinux.org/guides/interoperability/import_rocky_to_wsl/)

interoperability windows wsl wsl2

[](https://github.com/rocky-linux/documentation/edit/main/docs/guides/interoperability/import_rocky_to_wsl.md "Edit this page")

## Prerequisites[¶](#prerequisites "Permanent link")

The Windows-Subsystem for Linux feature has to be enabled. This is possible with one of these options:

*   [A newer WSL version with extra features is available in the Microsoft Store](https://apps.microsoft.com/store/detail/windows-subsystem-for-linux/9P9TQF7MRM4R). Use this newer version whenever possible.
*   Open an administrative Terminal (either PowerShell or Command-Prompt) and run `wsl --install` ([ref.](https://docs.microsoft.com/en-us/windows/wsl/install))
*   Go to the graphical Windows Settings and enable the optional feature `Windows-Subsystem for Linux`

Index of /wsl/jammy/current
===========================

![Icon ](/icons/blank.gif) [Name](?C=N;O=D)                                                [Last modified](?C=M;O=A)      [Size](?C=S;O=A)  [Description](?C=D;O=A)

* * *

![[PARENTDIR]](/icons/back.gif) [Parent Directory](/wsl/jammy/)                                                         -   
![[   ]](/icons/unknown.gif) [MD5SUMS](MD5SUMS)                                             2025-03-19 15:01  312   
![[   ]](/icons/unknown.gif) [MD5SUMS.gpg](MD5SUMS.gpg)                                         2025-03-19 15:01  833   
![[   ]](/icons/unknown.gif) [SHA256SUMS](SHA256SUMS)                                          2025-03-19 15:01  440   
![[   ]](/icons/unknown.gif) [SHA256SUMS.gpg](SHA256SUMS.gpg)                                      2025-03-19 15:01  833   
![[   ]](/icons/compressed.gif) [ubuntu-jammy-wsl-amd64-ubuntu22.04lts.rootfs.tar.gz](ubuntu-jammy-wsl-amd64-ubuntu22.04lts.rootfs.tar.gz) 2025-03-18 21:41  325M  File system image and Kernel packed
![[TXT]](/icons/text.gif) [ubuntu-jammy-wsl-amd64-wsl.manifest](ubuntu-jammy-wsl-amd64-wsl.manifest)                 2025-03-18 21:41   17K  Package manifest file
![[   ]](/icons/compressed.gif) [ubuntu-jammy-wsl-arm64-ubuntu22.04lts.rootfs.tar.gz](ubuntu-jammy-wsl-arm64-ubuntu22.04lts.rootfs.tar.gz) 2025-03-18 21:46  309M  File system image and Kernel packed
![[TXT]](/icons/text.gif) [ubuntu-jammy-wsl-arm64-wsl.manifest](ubuntu-jammy-wsl-arm64-wsl.manifest)                 2025-03-18 21:46   17K  Package manifest file
![[DIR]](../../../../cdicons/folder.png) [unpacked/](unpacked/)                                           2025-03-19 15:01    -   

* * *



2.  (optional) You will have to extract the .tar file from the .tar.xz file if you are using not one of the latest WSL versions

3.  Create the directory where the WSL will store its files (mostly somewhere in the userprofile)

4.  Finally, import the image into WSL ([ref.](https://docs.microsoft.com/en-us/windows/wsl/use-custom-distro#import-the-tar-file-into-wsl)):

    *   WSL:

        ```
        wsl --import <machine-name> <path-to-vm-dir> <path-to/rocky-9-image.tar.xz>
		
		wsl --import Ubuntu22.04 V:/Ubuntu22.04 C:/Users/$env:USERNAME/Downloads/ubuntu-jammy-wsl-amd64-ubuntu22.04lts.rootfs.tar 
        ```

    *   WSL 2:

        ```
        wsl --import <machine-name> <path-to-vm-dir> <path-to/rocky-9-image.tar.xz> --version 2
		
		wsl --import Ubuntu22.04 V:/Ubuntu22.04 C:/Users/$env:USERNAME/Downloads/ubuntu-jammy-wsl-amd64-ubuntu22.04lts.rootfs.tar --version 2
        ```

WSL vs. WSL 2

Generally speaking WSL 2 should be faster than WSL, but that might differ from use-case to use-case.

Windows Terminal

If you have Windows Terminal installed, the new WSL distro name will appear as an option on the pull-down menu, which is quite handy for launching in the future. You can then customize it with colors, fonts, etc.

systemd

Microsoft finally decided to bring systemd into the WSL. This feature is in the new WSL version from the Microsoft Store. You only need to add `systemd=true` to the `boot` ini section in the `/etc/wsl.conf` file! ([ref.](https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/#set-the-systemd-flag-set-in-your-wsl-distro-settings))

Microsoft Store

Currently there is no image in the Microsoft Store, if you want to help with bringing it to there join the conversation in the Mattermost SIG/Containers channel! There has been [some effort](https://github.com/rocky-linux/WSL-DistroLauncher) a long time ago, which can get picked up again.

Author: Lukas Magauer

