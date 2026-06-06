---
title: FreePBX Raspberry Pi
description: Instalação e configuração de FreePBX no Raspberry Pi
category: raspberry-pi
tags: [freepbx, voip, asterisk, pbx, raspberry-pi]
---

# FreePBX and Raspberry Pi

Source: [https://pbxbook.com/voip/raspbxmac.html](https://pbxbook.com/voip/raspbxmac.html)

>

1__Download__ the __RasPBX__ disk image from: [http://www.raspberry-asterisk.org/downloads/](http://www.raspbx.org/downloads/ "Asterisk Downloads")

*   eg: [raspbx-10-10-2020.zip](http://download.raspbx.org/raspbx-10-10-2020.zip)

2__Erase__ a (4GB) compact flash card. The easiest way to do this is with __Disk Utility__:

1.  Press CMD SPACE to reveal the Spotlight search bar.
2.  In this search bar, type "__disk utility__" and press return to launch the _Disk Utility_ application.
3.  Select the SD card in the left hand pane, and then select __Erase__ ensuring that the format is __MS-DOS (FAT)__.\
    __Note:__ If your Compact Flash card is larger than 4GB, you can expand the file system later with `raspi-config`

3Open the __Terminal__ application.

1.  Press CMD SPACE to reveal the Spotlight search bar.
2.  In this search bar, type "__terminal__", and press return to launch the _Terminal_ application.

4Identify the compact flash disk, and unmount it (mine was /dev/disk1).

*   `diskutil list`
*   `diskutil unmountdisk /dev/disk1`

__Note:__ In case of: Unmount of disk1 failed: at least one volume could not be unmounted,\
append the number of the DOS\_FAT\_32 partition, eg: `diskutil unmountdisk /dev/disk1s1`

5Navigate to the RasPBX disk image location (downloads), and __copy__ it with the __DD__ command.

*   `cd downloads`
*   `sudo dd if=raspbx-31-07-2014.img of=/dev/disk1 bs=2m`

Be patient! The DD command will take a long time, and there is no progress indication.

Output from the commands in steps 4 and 5:

```
mbp:~ mike$ diskutil list
/dev/disk0
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *250.1 GB   disk0
   1:                        EFI                         209.7 MB   disk0s1
   2:                  Apple_HFS MacHD                   249.2 GB   disk0s2
   3:                 Apple_Boot Recovery HD             650.0 MB   disk0s3
/dev/disk1
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *4.0 GB     disk1
   1:                 DOS_FAT_32 UNTITLED 1              4.0 GB     disk1s1
mbp:~ mike$ diskutil unmountdisk /dev/disk1
Unmount of all volumes on disk1 was successful
mbp:~ mike$ cd downloads
mbp:downloads mike$ sudo dd if=raspbx-31-07-2014.img of=/dev/disk1 bs=2m
Password:
1862+0 records in
1862+0 records out
3904897024 bytes transferred in 2033.352086 secs (1920423 bytes/sec)
mbp:~ mike$ 
```

6When finished, eject the flash card, plug it in your __Raspberry Pi__, and power up.

*   After a few moments, you should be able to SSH (and/or HTTP) into the Raspberry Pi.

    SSH: __ssh root\@raspbx.local__\
    Web GUI: __http\://raspbx.local__

Default SSH login:

User ID: __root__\
Password: __raspberry__

Default Web GUI login:

User ID: __admin__\
Password: __admin__

Default Mysql login:

User ID: __root__\
Password: __raspberry__

7Run the following commands (in the __Terminal__ application) to install the latest additions and improvements:

*   `ssh root@raspbx.local` - Console login, and
*   `raspbx-upgrade` - install software upgrades.
*   `raspi-config` - if the CF is larger than 4GB, expand the file system to fill it.

*   __Note:__ If the SSH connection is refused with the following error, we must delete the offending RSA key.

    ```
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    ```

    Enter the command: `ssh-keygen -R raspbx.local` or `ssh-keygen -R <IP Address>` and try again.

8Open __Safari__, enter the URL __http\://raspbx.local__,

*   Click __FreePBX Administration__, and log in with admin/admin (left image).

9Goto __Applications ➤ Extensions__ and create a __Generic SIP Device__ (center/right image).

*   When configuring your client(s), the __extension__ number is the _username_, the __secret string__ is the _password_.

10Installing and registering __SIP clients__:

1.  Download and install [Telephone](https://itunes.apple.com/en/app/telephone/id406825478?mt=12) (free) SIP softphone on your Mac. Open __Preferences ➤ Accounts__
2.  Add an account: domain name: __raspbx.local__, username is the __extension__ number, and password the __secret__ string.
3.  The softphone should register with your PBX, and immediately work! Call your VoiceMail with __\*98__.
4.  Finally, if you have an iPhone or iPad, search for [3CX](https://itunes.apple.com/us/app/3cxphone-for-3cx-phone-system/id660230142?mt=8/) in the App Store (free). Install it, and add a new Account...\
    "User" & "ID" are the _extension_, "Password" is the _secret string_, and "Local Server IP" is _raspbx.local_

You can also use the terminal disk-copy technique above (steps 2 thru 5) to try out other software images.\
For example, to turn your RaspberryPi into a media server with [OpenELEC](http://openelec.tv/get-openelec "OpenELEC Downloads"), or a retro-gaming console with [RetroPie](https://retropie.org.uk/ "RetroPie Downloads").

![ApplePi-Baker](https://pbxbook.com/images/appicons/ApplePi-Baker.png)

ApplePi-Baker

|                                                                                                                                                                                                                                                                                                                     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [ApplePi-Baker v2](https://www.tweaking4all.com/hardware/raspberry-pi/applepi-baker-v2/) is a GUI application which allows you to 'flash' an IMG file to an SD-Card, or make IMG backups without needing to use any OS X terminal commands. It's also useful for creating or restoring an IMG backup of USB drives! |
