For more information about this image and its history, please see its the 
[GitHub repository][1].

[1]: https://github.com/mottosso/docker-usd

# Usage

To use this image, use `docker build` followed by `docker run`.

```bash
$ docker build -t mottosso/usd https://github.com/mottosso/docker-usd.git
$ docker run -ti -h usd --rm -v $(pwd):/home/root mottosso/usd
```

Building takes about an hour on a fast machine and occupies 7.9 gb of disk space; but you'll only need to do it once.

Some explanation of flags.

```bash
-ti  = Run in interactive mode.
-h   = Set the hostname of the Docker client.
--rm = Once you exit, remove this client.
-v   = Mount your current working to the current working directory of the client.
```

And a useful alias, such that when you enter `usd`, you'll enter a bash-shell with your current working directory without typing too much.

```bash
$ alias usd="docker run -ti -h usd --rm -v $(pwd):/home/root mottosso/usd"
$ usd
[root@usd root]# []
```

This will download and run the latest image of USD.

Images occupy around **5 gb** of virtual disk space once installed, and about 
**500 mb** of bandwidth to download.

# What's in this image?

This image builds on the original [centos:6.7][] image

[centos:6.7]: https://github.com/CentOS/sig-cloud-instance-images/blob/d0b72df83f49da844f88aabebe3826372f675370/docker/Dockerfile
