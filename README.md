# alpine-cvs

Docker container with alpine and cvs pserver

BUILD
-----

```console
docker build -t costamauricio/alpine-cvs .
```

VOLUME
------
```console
/var/cvsroot
```

ENV
---
```console
$CVS_USER #cvs
$CVS_PASSWD #cvs
```

RUN
---
```console
docker run -d -p 2401:2401 costamauricio/alpine-cvs
```

DEPLOY
------
```console
sh deploy.sh
```

### Verify container
```console
docker ps
```

### Stop container
```console
docker container stop "{CONTAINER_ID}" 
```


### Connect to CVS
```console
export CVSROOT=:pserver:cvs@localhost:/var/cvsroot
cvs login
```
