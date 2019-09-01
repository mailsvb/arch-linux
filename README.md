### Arch Linux
![](https://sources.archlinux.org/other/artwork/archlinux-logo-dark-90dpi.png)

Arch Linux is an independently developed, x86-64 general-purpose GNU/Linux distribution that strives to provide the latest stable versions of most software by following a rolling-release model, allowing for a one-time install with continuous upgrades. The default installation is a minimal base system, configured by the user to only add what is required for his purposes.

### Image Build Process
This image is built based on the official Arch Linux Docker image [archlinux/base](https://hub.docker.com/r/archlinux/base) with a few modifications. You can find information about the minimizations here: [http://unix.stackexchange.com/a/233401](http://unix.stackexchange.com/a/233401) and here: [yantis/archlinux-small](https://hub.docker.com/r/yantis/archlinux-small/~/dockerfile/)

### Usage
```
docker pull mailsvb/arch-linux:latest
docker run --rm -it mailsvb/arch-linux:latest
```

### Limitations
Due to the minimization, the image cannot be used for compilation tasks. It aims at running applications installed via pacman
