ARG BASE_IMAGE=ghcr.io/epicgames/unreal-engine:dev-slim-4.27
FROM $BASE_IMAGE

USER root
##########  bias ##########
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
	rsync \
    sudo \
    wget \
    x11-xserver-utils \
    git \
    tmux \
    vim \
    neovim \
    python3 \
    python3-dev \
    python3-pip \
    cmake \
    build-essential \
    curl \
    wget \
    tzdata \
    tree \
    nodejs \
    npm
######### neovim install #########
RUN cd /root/ && wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
RUN cd /root/ && tar xzvf nvim-linux64.tar.gz
RUN rm /root/nvim-linux64.tar.gz
RUN mv /root/nvim-linux64 /
RUN ln -sf /nvim-linux64/bin/nvim /usr/bin/nvim
######### vim/neovim setup #########
RUN pip3 install jedi-language-server
RUN npm install -g n
RUN n stable
RUN mkdir -p /root/.vim/undo
RUN mkdir -p /root/.vim/plugged
RUN mkdir -p /root/.config/nvim
######### dotfiles #########
RUN git clone https://github.com/ToshikiNakamura0412/dotfiles_for_docker.git /root/dotfiles
ENV DOTFILES="/root/dotfiles"
RUN ln -sf $DOTFILES/profile.sh /etc/profile.d/profile.sh
RUN ln -sf $DOTFILES/vim/vimrc /root/.vimrc
RUN ln -sf $DOTFILES/vim/init.vim /root/.config/nvim/init.vim
RUN ln -sf $DOTFILES/vim/coc-settings.json /root/.config/nvim/coc-settings.json
RUN ln -sf $DOTFILES/tmux.conf /root/.tmux.conf
######### AirSim #########
USER ue4
RUN cd /home/ue4 && \
	git clone --progress https://github.com/Microsoft/AirSim.git && \
	cd AirSim && \
	./setup.sh && \
	./build.sh
WORKDIR /home/ue4


