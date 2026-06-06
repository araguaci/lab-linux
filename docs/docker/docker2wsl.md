# Docker Container to WSL Distro

```bash
docker pull $OS_IMAGE

docker run -itd --name $CONTAINER_NAME $OS_IMAGE

docker [container] export > "$EXPORT_PATH/$CONTAINER_NAME.tar" $CONTAINER_NAME

wsl --import $DISTRO_NAME $DISTRO_PATH "$EXPORT_PATH/$CONTAINER_NAME.tar"

wsl -d $DISTRO_NAME

wsl -s $DISTRO_NAME

wsl --unregister $DISTRO_NAME
```

```
docker export container_id | gzip > new_container.tar.gz
```


## Debian 12

```bash
cd "C:\WSL2-Distros"

docker pull debian:12

docker run -itd --name debian12 debian:12

docker export > debian12.tar debian12

wsl --import debian12 "C:\WSL2-Distros\debian12" debian12.tar

wsl -d debian12

wsl -s debian12
ls
wsl --unregister debian12
```

## Ubuntu 22.04

```bash
cd "V:\WSL"

docker pull ubuntu:22.04

docker run -itd --name ubuntu2204 ubuntu:22.04

docker export > ubuntu2204.tar ubuntu2204

wsl --import ubuntu2204 "V:\WSL\ubuntu2204" ubuntu2204.tar

wsl -d ubuntu2204

wsl -s ubuntu2204

wsl --unregister ubuntu2204
```

## Fedora 39

```bash
cd "C:\WSL"

docker pull fedora:39

docker run -itd --name fedora39 fedora:39

docker export > fedora39.tar fedora39

wsl --import fedora39 "C:\WSL\fedora39" fedora39.tar

wsl -d fedora39

wsl -s fedora39

wsl --unregister fedora39
```

## Centos 7

```bash
cd "C:\WSL"

docker pull centos:7

docker run -itd --name centos7 centos:7

docker export > centos7.tar centos7

wsl --import centos7 "C:\WSL\centos7" centos7.tar

wsl -d centos7

wsl -s centos7

wsl --unregister centos7
```

## Centos 8

```bash
cd "C:\WSL"

docker pull centos:8

docker run -itd --name centos8 centos:8

docker export > centos8.tar centos8

wsl --import centos8 "C:\WSL\centos8" centos8.tar

wsl -d centos8

wsl -s centos8

wsl --unregister centos8
```

## RedHat UBI 8

```bash
cd "C:\WSL"

docker pull redhat/ubi8

docker run -itd --name redhat8 redhat/ubi8

docker export > redhat8.tar redhat8

wsl --import redhat8 "C:\WSL\redhat8" redhat8.tar

wsl -d redhat8

wsl -s redhat8

wsl --unregister redhat8
```

## RedHat UBI 9

```bash
cd "C:\WSL"

docker pull redhat/ubi9

docker run -itd --name redhat9 redhat/ubi9

docker export > redhat9.tar redhat9

wsl --import redhat9 "C:\WSL\redhat9" redhat9.tar

wsl -d redhat9

wsl -s redhat9

wsl --unregister redhat9
```

## RockyLinux 8

```bash
cd "C:\WSL"

docker pull rockylinux:8

docker run -itd --name rocky8 rockylinux:8

docker export > rocky8.tar rocky8

wsl --import rocky8 "C:\WSL\rocky8" rocky8.tar

wsl -d rocky8

wsl -s rocky8

wsl --unregister rocky8
```

## RockyLinux 9

```bash
cd "C:\WSL"

docker pull rockylinux:9

docker run -itd --name rocky9 rockylinux:9

docker export > rocky9.tar rocky9

wsl --import rocky9 "C:\WSL\rocky9" rocky9.tar

wsl -d rocky9

wsl -s rocky9

wsl --unregister rocky9
```