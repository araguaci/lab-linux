# Import Rocky Linux to WSL or WSL2

By Lukas Magauer

Source: [https://docs.rockylinux.org/guides/interoperability/import\_rocky\_to\_wsl/](https://docs.rockylinux.org/guides/interoperability/import_rocky_to_wsl/)

interoperability windows wsl wsl2

[](https://github.com/rocky-linux/documentation/edit/main/docs/guides/interoperability/import_rocky_to_wsl.md "Edit this page")

## Prerequisites[¶](#prerequisites "Permanent link")

The Windows-Subsystem for Linux feature has to be enabled. This is possible with one of these options:

*   [A newer WSL version with extra features is available in the Microsoft Store](https://apps.microsoft.com/store/detail/windows-subsystem-for-linux/9P9TQF7MRM4R). Use this newer version whenever possible.
*   Open an administrative Terminal (either PowerShell or Command-Prompt) and run `wsl --install` ([ref.](https://docs.microsoft.com/en-us/windows/wsl/install))
*   Go to the graphical Windows Settings and enable the optional feature `Windows-Subsystem for Linux`

This feature should be available on every supported Windows 10 and 11 version right now.

## Steps[¶](#steps "Permanent link")

1.  Get the container rootfs. This is possible in multiple ways:

    *   __Preferred:__ Download the image from the CDN:

        *   8: [Base x86\_64](https://dl.rockylinux.org/pub/rocky/8/images/x86_64/Rocky-8-Container-Base.latest.x86_64.tar.xz), [Minimal x86\_64](https://dl.rockylinux.org/pub/rocky/8/images/x86_64/Rocky-8-Container-Minimal.latest.x86_64.tar.xz), [UBI x86\_64](https://dl.rockylinux.org/pub/rocky/8/images/x86_64/Rocky-8-Container-UBI.latest.x86_64.tar.xz), [Base aarch64](https://dl.rockylinux.org/pub/rocky/8/images/aarch64/Rocky-8-Container-Base.latest.aarch64.tar.xz), [Minimal aarch64](https://dl.rockylinux.org/pub/rocky/8/images/aarch64/Rocky-8-Container-Minimal.latest.aarch64.tar.xz), [UBI aarch64](https://dl.rockylinux.org/pub/rocky/8/images/aarch64/Rocky-8-Container-UBI.latest.aarch64.tar.xz)
        *   9: [Base x86\_64](https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-Container-Base.latest.x86_64.tar.xz), [Minimal x86\_64](https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-Container-Minimal.latest.x86_64.tar.xz), [UBI x86\_64](https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-Container-UBI.latest.x86_64.tar.xz), [Base aarch64](https://dl.rockylinux.org/pub/rocky/9/images/aarch64/Rocky-9-Container-Base.latest.aarch64.tar.xz), [Minimal aarch64](https://dl.rockylinux.org/pub/rocky/9/images/aarch64/Rocky-9-Container-Minimal.latest.aarch64.tar.xz), [UBI aarch64](https://dl.rockylinux.org/pub/rocky/9/images/aarch64/Rocky-9-Container-UBI.latest.aarch64.tar.xz)

    *   Extract the image from either Docker Hub or Quay.io ([ref.](https://docs.microsoft.com/en-us/windows/wsl/use-custom-distro#export-the-tar-from-a-container))

        ```
        <podman/docker> export rockylinux:9 > rocky-9-image.tar
        ```

2.  (optional) You will have to extract the .tar file from the .tar.xz file if you are using not one of the latest WSL versions

3.  Create the directory where the WSL will store its files (mostly somewhere in the userprofile)

4.  Finally, import the image into WSL ([ref.](https://docs.microsoft.com/en-us/windows/wsl/use-custom-distro#import-the-tar-file-into-wsl)):

    *   WSL:

        ```
        wsl --import <machine-name> <path-to-vm-dir> <path-to/rocky-9-image.tar.xz>
		
		wsl --import rocky-9 V:/Rocky/rocky-9 C:/Users/$env:USERNAME/Downloads/Rocky-9-Container-Base.latest.x86_64.tar.xz 
        ```

    *   WSL 2:

        ```
        wsl --import <machine-name> <path-to-vm-dir> <path-to/rocky-9-image.tar.xz> --version 2
		
		wsl --import rocky-9 V:/Rocky/rocky-9 C:/Users/$env:USERNAME/Downloads/Rocky-9-Container-Base.latest.x86_64.tar.xz --version 2
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
