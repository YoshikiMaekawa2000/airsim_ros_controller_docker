ARG BASE_IMAGE=nvidia/cudagl:10.0-devel-ubuntu18.04
FROM $BASE_IMAGE

USER root

RUN apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
	rsync \
    sudo \
    wget \
    x11-xserver-utils \
    git \
    tmux \
    vim

RUN useradd -ms /bin/bash ue4
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    adduser ue4 sudo 

USER ue4
RUN cd /home/ue4 && \
	git clone --progress https://github.com/Microsoft/AirSim.git && \
	cd AirSim && \
	./setup.sh && \
	./build.sh

WORKDIR /home/ue4


