### install docker
```
sudo apt install docker.io
```
### (Optional) login to access private docker images
```
sudo docker login
```
**Enter username and password to login**

### To pull a public or private(with login credentials) docker image
```
sudo docker pull <user_name>/<repo_name>:<tag_name>
```
### To push a public or private(with login credentials) docker image
```
sudo docker push <user_name>/<repo_name>:<tag_name>
```

### To run a container from the image image_name
```
sudo docker run --rm -it <user_name>/<repo_name>:<tag_name>
```
- **it renders an interactive terminal**
- **rm removes the container as we exit the terminal**

## Building container fromm scratch
1. create a directory that acts as a docker root/home directory(hereafter referrred to as dockerdir)
2. By default the docker uses *Dockerfile* (case-sensitve) to build the image
- here is an  example of dockerfile
```
FROM ubuntu:14.04
RUN apt update && apt install -y\ 
	gawk\
 	wget\
 	git-core\
	diffstat\
	unzip\
	texinfo\
	gcc-multilib\
	build-essential\
	chrpath\
	socat\
	libsdl1.2-dev\ 
	xterm\
	libssl-dev\
	nano\
	libsqlite3-dev\
	curl
WORKDIR "/"
COPY local.conf .

```
3. To build the image based on the *Dockerfile*, run 
```
sudo docker build -t temp .
```
- **the *build* command by default is referenced to the dockerdir**
- **-t provides a tagname to the image built**

4. Including files from the host system in the docker container
- Place the files preferably in the dockerdir
- Copy them during containerization using the COPY command given in the example dockerfile





