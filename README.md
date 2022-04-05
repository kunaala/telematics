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


Current stage:
output after the command
Parsing recipes: 100% |##########################################| Time: 0:00:33
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1282 targets, 44 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.38.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-14.04"
TARGET_SYS           = "i586-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "2.5.2"
TUNE_FEATURES        = "m32 i586"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "HEAD:58e82c451071d0e257da6088cf643e636282084c"

NOTE: Fetching uninative binary shim from http://downloads.yoctoproject.org/releases/uninative/2.3/x86_64-nativesdk-libc.tar.bz2;sha256sum=c6954563dad3c95608117c6fc328099036c832bbd924ebf5fdccb622fc0a8684
Initialising tasks: 100% |#######################################| Time: 0:00:02
NOTE: Executing SetScene Tasks
WARNING: m4-native-1.4.18-r0 do_fetch: Failed to fetch URL http://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.gz, attempting MIRRORS if available
WARNING: libtool-native-2.4.6-r0 do_fetch: Failed to fetch URL http://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.gz, attempting MIRRORS if available
WARNING: expat-native-2.2.5-r0 do_fetch: Failed to fetch URL http://downloads.sourceforge.net/expat/expat-2.2.5.tar.bz2, attempting MIRRORS if available
WARNING: popt-native-1.16-r3 do_fetch: Failed to fetch URL https://fossies.org/linux/misc/popt-1.16.tar.gz, attempting MIRRORS if available
WARNING: libpcre-8.41-r0 do_fetch: Failed to fetch URL https://ftp.pcre.org/pub/pcre/pcre-8.41.tar.bz2, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 3097 tasks of which 0 didn't need to be rerun and all succeeded.

Summary: There were 5 WARNING messages shown.






