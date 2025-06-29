<#
- BIOS of host machine also needs to be configured to allow hardware virtualization
- Windows 10 Pro or otherwise is needed; Windows 10 Home Edition CANNOT get WSL
- This gist WSLv2, but can use WSLv1 instead. I needed v1 as I run Windows 10 in a VM in Virtualbox.
- WSLv2 has been giving me problems in Virtualbox 6.1, but WSLv1 works properly.
- vbox has issues with the GUI settings when it comes to nested virtualization on certain systems,
  so run the following if needing to give a VM this enabled setting:

  VBoxManage modifyvm <vm-name> --nested-hw-virt on
#>

## IN AN ELEVATED SHELL
## Right-click PowerShell -> Run As Administrator

# Enable Needed Virtualization
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Download Ubuntu 20.04 Focal Fosa
# Uncomment if wanting 20.04 instead of latest
# Invoke-WebRequest -Uri https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64-wsl.rootfs.tar.gz -OutFile $ENV:HOMEDRIVE$ENV:HOMEPATH\Downloads\ubuntu-20.04-focal-wsl.tar.gz -UseBasicParsing
# Download Ubuntu 22.04 Jammy Jellyfish
# Invoke-WebRequest -Uri https://cloud-images.ubuntu.com/wsl/jammy/current/ubuntu-jammy-wsl-amd64-wsl.rootfs.tar.gz -OutFile $ENV:HOMEDRIVE$ENV:HOMEPATH\Downloads\ubuntu-22.04-jammy-wsl.tar.gz -UseBasicParsing
# Download Ubuntu 24.04 Noble Numbat
Invoke-WebRequest -Uri https://cloud-images.ubuntu.com/wsl/noble/current/ubuntu-noble-wsl-amd64-wsl.rootfs.tar.gz -OutFile $ENV:HOMEDRIVE$ENV:HOMEPATH\Downloads\ubuntu-24.04-noble-wsl.tar.gz -UseBasicParsing

# Setup reserved directory path for WSL VM
# mkdir c:\UbuntuFocal # If doing Focal
# mkdir c:\UbuntuJammy # If doing Jammy
mkdir c:\UbuntuNoble # If doing Noble

# Configure WSL for incoming VM
# For more information about WSL: https://docs.microsoft.com/en-us/windows/wsl/about
wsl --set-default-version 2 # Change to '1' if not able to support 2
# Import into WSL
# wsl.exe --import UbuntuFocal C:\UbuntuFocal $ENV:HOMEDRIVE$ENV:HOMEPATH\Downloads\ubuntu-20.04-focal-wsl.tar.gz
# wsl.exe --import UbuntuJammy C:\UbuntuJammy $ENV:HOMEDRIVE$ENV:HOMEPATH\Downloads\ubuntu-22.04-jammy-wsl.tar.gz
wsl.exe --import UbuntuJammy C:\UbuntuJammy $ENV:HOMEDRIVE$ENV:HOMEPATH\Downloads\ubuntu-24.04-noble-wsl.tar.gz
wsl # Drops straight into default VM. Will be UbuntuFocal is WSL alternate VM didn't already exist

## BONUS: Docker Desktop
# Checkout the Install-ChocoStarterPackages gist for setting up choco (and other things):
# - https://gist.github.com/ScriptAutomate/02e0cf33786f869740ee963ed6a913c1
# Once chocolatey / choco is installed, and WSL is already configured with Ubuntu,
# run the following command from PowerShell, and not from within WSL:
# choco install docker-desktop -y