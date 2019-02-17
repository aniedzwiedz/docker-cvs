docker build -t costamauricio/alpine-cvs .
docker run -d -p 2401:2401 --name=cvs -v $(pwd)/cvsroot:/var/cvsroot costamauricio/alpine-cvs
