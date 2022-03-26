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
#RUN repo init  -u https://source.codeaurora.org/quic/le/le/manifest/refs/?h=IMM.LE.1.0\
#	-b release -m caf_AU_LINUX_EMBEDDED_IMM.LE.1.0_TARGET_ALL.01.04.002.xml
#RUN repo init -q -u git://codeaurora.org/quic/le/le/manifest.git \    
#	-b release -m caf_AU_LINUX_EMBEDDED_LE.UM.1.3.R5_TARGET_ALL.01.66.138.xml
RUN  curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo &&\
	chmod a+x /usr/bin/repo
RUN wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz && tar -xvf Python-3.6.3.tgz 
WORKDIR "/Python-3.6.3"
RUN sudo ./configure --enable-optimizations &&  sudo make -j8 && sudo make install
WORKDIR "/"
RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python3.6 100
RUN repo init -u git://codeaurora.org/quic/le/le/manifest.git	-b release -m caf_AU_LINUX_EMBEDDED_LE.AU_EAP.1.0.R2_TARGET_ALL.01.351.004.xml
RUN repo sync -j 32
WORKDIR "/sources/poky"
RUN mkdir -p build/python-bin && \
	ln -s /usr/bin/python2 build/python-bin/python && \
	mkdir -p build/tmp/hosttools && \
	ln -sf /usr/bin/python2 build/tmp/hosttools/python
RUN mv oe-init-build-env os-init-build-env.bak
COPY oe-init-build-env /sources/poky
RUN chmod a+x oe-init-build-env && ./oe-init-build-env
WORKDIR "/sources/poky/build/conf"
RUN mv local.conf local.conf.bak
COPY local.conf .
WORKDIR "/sources/poky"
RUN ./oe-init-build-env



