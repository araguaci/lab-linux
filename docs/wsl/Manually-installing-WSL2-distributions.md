# Manually installing WSL2 distributions

By Miro

Source: [https://dev.to/milolav/manually-installing-wsl2-distributions-41b4](https://dev.to/milolav/manually-installing-wsl2-distributions-41b4)

There are a few different ways of installing Linux distributions for WSL. The easiest, using Microsoft Store, or using tools like [LxRunOffline](https://github.com/DDoSolitary/LxRunOffline) or [wsldl](https://github.com/yuk7/wsldl). But distribution can be installed manually as well.

WSL command line allows to export distribution to a tar file, or to import from a tar file as a new distribution.

Let's say I have Ubuntu installed from Microsoft Store, if I list them from a command line I will get something like this:

```
PS E:\Temp> wsl --list --all -v
  NAME            STATE           VERSION
* Ubuntu-20.04    Stopped         2
```

And if I export it:

```
PS E:\Temp> wsl --export Ubuntu-20.04 E:\WSL2\ubuntu.tar
```

I will get a tar file containing a root filesystem of my Ubuntu distribution. And I can import that as a new distribution:

```
PS E:\Temp> wsl --import Ubuntu-Copy E:\WSL2\Ubuntu-Copy E:\WSL2\ubuntu.tar
```

This will create a folder `Ubuntu-Copy` folder in the `E:\WSL2` and the `ext4.vhdx` file in that folder. Virtual hard disk is an ext4 partitioned disk containing the contents of the tar file. Listing distributions now shows two of them.

```
PS E:\Temp> wsl --list --all -v
  NAME            STATE           VERSION
* Ubuntu-20.04    Stopped         2
  Ubuntu-Copy     Stopped         2
```

If I start the second distribution, I will be logged in as a root account:

```
PS E:\Temp> wsl -d Ubuntu-Copy
root@PC123:/mnt/e/Temp#
```

Ok, so if import works for the exported root filesystem, will it work for any root filesystem? And the answer is Yes!

For example, if I download `alpine-minirootfs-3.12.0-x86_64.tar.gz` from [https://alpinelinux.org/downloads/](https://alpinelinux.org/downloads/) I can import it like this:

```
PS E:\Temp> wsl --import Alpine-3.12 E:\WSL2\Alpine-3.12 E:\WSL2\alpine-minirootfs-3.12.0-x86_64.tar.gz
```

It even works with tar.gz files, not just .tar files. In fact, Alpine distribution available in Microsoft Store does exactly that. Downloads this file and installs it. Source for the launcher is available here: [https://github.com/agowa338/WSL-DistroLauncher-Alpine](https://github.com/agowa338/WSL-DistroLauncher-Alpine)

Similar to the reference implementation of the launcher ([WSL-DistroLauncher](https://github.com/microsoft/WSL-DistroLauncher)) it allows user creation on start-up and it has some additional fixes. See the [DistroSpecial.h](https://github.com/agowa338/WSL-DistroLauncher-Alpine/blob/master/DistroLauncher/DistroSpecial.h) file.

After distribution is complete I can manually create user, the same way launcher does

```
PS E:\Temp> wsl -d Alpine-3.12 /usr/sbin/adduser -g '' -D user1
Changing password for user1
New password:
Retype password:
passwd: password for user1 changed by root
```

And then logging in like

```
PS E:\Temp> wsl -d Alpine-3.12 -u user1
PC123:/mnt/e/Temp$
```

In a nutshell this is it. A new distribution is manually installed.

__Important thing to note__:\
By unregistering the distribution like `wsl --unregister Ubuntu-20.04` it will __delete the associated `ext4.vhdx` file.__ Make sure to backup any important data form the virtual hard disk before unregistering.

## [](#startup-scripts)Start-up scripts

Instead manually creating users and setting everything up, I can write all commands in a text file and execute them.

For example, a dummy `init` file that displays current date and release name

```
date
cat /etc/*-release
```

Start like

```
E:\Temp> wsl -d Debian-10-Slim < init
```

And the result is

```
Fri Aug  6 23:08:29 BST 2020
PRETTY_NAME="Debian GNU/Linux 10 (buster)"
NAME="Debian GNU/Linux"
VERSION_ID="10"
VERSION="10 (buster)"
VERSION_CODENAME=buster
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
```

Or run that file directly as a shell script from a know location

```
PS E:\Temp> wsl -d Alpine-3.12 /bin/sh /mnt/e/Temp/init

Fri Aug  6 22:17:05 UTC 2020
3.12.0
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.12.0
PRETTY_NAME="Alpine Linux v3.12"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://bugs.alpinelinux.org/"
```

## [](#registry-keys)Registry keys

When distribution is installed its settings are stored in the registry `HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss\{GUID}`

Guid is, as far as I can tell, randomly generated for every distribution installation

For example, official installation of Ubuntu creates similar to the following:

```
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss\{2506e37c-8479-4433-9ea8-7549090aa5bf}]
"State"=dword:00000001
"DistributionName"="Ubuntu-20.04"
"Version"=dword:00000002
"BasePath"="C:\\Users\\User\\AppData\\Local\\Packages\\CanonicalGroupLimited.Ubuntu20.04onWindows_79rhkp1fndgsc\\LocalState"
"Flags"=dword:0000000f
"DefaultUid"=dword:000003e8
"PackageFamilyName"="CanonicalGroupLimited.Ubuntu20.04onWindows_79rhkp1fndgsc"
"KernelCommandLine"="BOOT_IMAGE=/kernel init=/init"
"DefaultEnvironment"=hex(7):<snipped>
```

Which means that virtual hard disk is stored in the `C:\Users\User\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu20.04onWindows_79rhkp1fndgsc\LocalState` folder and default Uid is 1000 (0x3e8).

Looking at the Alpine distribution:

```
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss\{b9a51057-c168-4798-a89e-483c97278f3c}]
"State"=dword:00000001
"DistributionName"="Alpine-3.12"
"Version"=dword:00000002
"BasePath"="\\\\?\\E:\\WSL2\\Alpine-3.12"
"Flags"=dword:0000000f
"DefaultUid"=dword:00000000
```

it omits some settings, but `BasePath` points to a folder containing `ext4.vhdx` file and `DefaultUid` is the Uid of the user when starting the distribution without the `-u <user>` option.

Moving a distribution to a different location requires just to move the `ext4.vhdx` to a new folder and update the `BasePath` value. Similarly, changing a default user requires an update to the `DefaultUid` value.

To "restore" a missing distribution, copy a registry key, update the `DistributionName`, `BasePath`, and `DefaultUid` values, and it is ready to go. Or import an empty tar file (created like `tar -zvcf empty.tar.gz -T /dev/null`) and swap out the resulting empty ext4.vhdx with the real one.

## [](#other-distributions)Other distributions

Following the examples from the [wsldl](https://github.com/yuk7/wsldl) project, a simple way of installing different linux distributions is to take root filesystem used to make docker images. For example [Dockerfile for Debian Buster Slim](https://github.com/debuerreotype/docker-debian-artifacts/blob/dist-amd64/buster/slim/Dockerfile) says `ADD rootfs.tar.xz /`. I can download the [rootfs.tar.xz](https://github.com/debuerreotype/docker-debian-artifacts/blob/dist-amd64/buster/slim/rootfs.tar.xz), unpack it since WSL doesn't recognize tar.xz file format, import it and run it like:

```
PS E:\Temp> wsl --import Debian-10-Slim E:\WSL2\Debian-10-Slim E:\WSL2\debian-buster-slim-20200803-rootfs.tar
PS E:\Temp> wsl -d Debian-10-Slim
root@PC123:/mnt/e/Temp#
```

## [](#official-raw-installtargz-endraw-)Official `install.tar.gz`

When installing Ubuntu or Debian Linux distribution from the Microsoft Store root filesystem is downloaded as a part of Store App installation. This means that initial filesystem tar, `install.tar.gz` can be found in the `C:\Program Files\WindowsApps \CanonicalGroupLimited.Ubuntu20.04onWindows_2004.2020.424.0_x64__79rhkp1fndgsc\` folder, for the Ubuntu 20.04 installation.

For a different version, folder name in the `C:\Program Files\WindowsApps` will be different, but it should contain `install.tar.gz` file.

And that file can be imported as a new distribution in the same way as mentioned above.

## [](#differencing-disks)Differencing disks

Since WSL2 is using vhdx disks, I was wondering can I use differencing disks. And the answer is again Yes.

Having 5 instances of Ubuntu will take about 5GB of space immediately. Base vhdx is about 1GB. But, by leveraging differencing disks, I can have one base disk, and 5 smaller, differencing disks.

First stop all distributions with `wsl --shutdown`, then move existing `ext4.vhdx` to a new folder (one level up in my case), and create a differencing disk with the `ext4.vhdx` name.

```
PS E:\WSL2\Ubuntu-20.04> New-VHD -ParentPath ..\base.vhdx -Path ext4.vhdx -Differencing -BlockSizeBytes 1048576
```

When creating virtual hard disks for linux, __make sure that you use 1MB block size__. Default block size of 32MB will result in fairly large vhdx file once it starts to get filled.

Only article where I found this recommendation is [Understanding and Working with VHD(X) Files](https://www.altaro.com/hyper-v/understanding-working-vhdx-files/)

> For Linux systems, there is a soft recommendation to use a 1 megabyte block size

By examining `ext4.vhdx` created by the installation, details also show 1MB block size

```
PS E:\WSL2\Ubuntu-Copy> Get-VHD .\ext4.vhdx | Format-List

ComputerName            : PC123
Path                    : E:\WSL2\Ubuntu-Copy\ext4.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 1164967936
Size                    : 274877906944
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 1048576
ParentPath              :
DiskIdentifier          : A96ADE57-4838-48EA-97A9-DE02790ADCB4
FragmentationPercentage : 53
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
```

### [](#blocksize-effect-on-a-dynamic-disk-file-size)BlockSize effect on a dynamic disk file size

A little digression. Comparing a file size for vhdx with 1MB block size vs default 32MB block size.

I've created two vhdx files:

```
PS E:\Temp> New-VHD -Path .\256_default.vhdx -SizeBytes 256GB

Path                    : E:\Temp\256_default.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 274877906944
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
```

and

```
PS E:\Temp> New-VHD -Path .\256_1mb.vhdx -SizeBytes 256GB -BlockSizeBytes 1MB

Path                    : E:\Temp\256_1mb.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 6291456
Size                    : 274877906944
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 1048576
```

Initial sizes were 4MB and 6MB.

Attached them to a Hyper-V VM, booted the `alpine-virt-3.12.0-x86_64.iso` .

Then I ran `mkfs.ext4 /dev/sda` and `mkfs.ext4 /dev/sdb` and shut down the VM.

Resulting files are

```
PS E:\Temp> Get-VHD .\256_default.vhdx | Format-List

Path                    : E:\Temp\256_default.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4869586944
Size                    : 274877906944
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
```

and

```
PS E:\Temp> Get-VHD .\256_1mb.vhdx | Format-List

Path                    : E:\Temp\256_1mb.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 162529280
Size                    : 274877906944
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 1048576
```

As you can see, after making the ext4 filesystem on a 256GB dynamic disk, the one with a 32MB block size grew to __4,53GB__ while while the one with the 1MB block size grew to just 155MB.

## [](#the-end)The end

Anyway, WSL2 seems interesting enough 😁
