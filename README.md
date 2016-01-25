For more information about this image and its history, please see its the 
[GitHub repository][1].

[1]: https://github.com/mottosso/docker-usd

# Usage

To use this image, use `docker build` followed by `docker run`.

```bash
$ docker build -t mottosso/usd https://github.com/mottosso/docker-usd.git
$ docker run -ti -h usd --rm -v $(pwd):/home/root mottosso/usd
```

- See [EULA](http://graphics.pixar.com/usd/usdDownload.html)

Building takes about an hour on a fast machine and occupies **7.9 gb of disk space**; but you'll only need to do it once.

Some explanation of flags.

```bash
-ti  = Run in interactive mode.
-h   = Set the hostname of the Docker client.
--rm = Once you exit, remove this client.
-v   = Mount your current working to the current working directory of the client.
```

**Aliases**

Enter bash from your current working directory without typing too much.

```bash
$ alias usd="docker run -ti -h usd --rm -v $(pwd):/home/root mottosso/usd"
$ usd
[root@usd root]# pypix
Python 2.7.5 (default, Sep 22 2015, 13:38:15)
[GCC 4.8.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> from pxr import Usd
>>>
```

Or enter `pypix` immediately.

```bash
$ alias pypix="docker run -ti -h usd --rm -v $(pwd):/home/root mottosso/usd bash --login -c pypix"
$ pypix
Python 2.7.5 (default, Sep 22 2015, 13:38:15)
[GCC 4.8.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> from pxr import Usd
>>>
```

# What's in this image?

This image builds on the original [centos:6.7][] image

[centos:6.7]: https://github.com/CentOS/sig-cloud-instance-images/blob/d0b72df83f49da844f88aabebe3826372f675370/docker/Dockerfile
