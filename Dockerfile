FROM alpine:latest

# マルチバイト文字をまともに扱うための設定
ENV LANG="en_US.UTF-8" LANGUAGE="en_US:ja" LC_ALL="en_US.UTF-8"

# 最低限必要なパッケージ
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    build-base \
    curl \
    gcc \
    git \
    go \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    musl-dev\
    neovim \
    nodejs \
    npm \
    python3-dev \
    py3-pip \
    ruby \
    ruby-dev \
    neovim-doc \
    fzf \ 
    && \
    rm -rf /var/cache/apk/*

RUN pip3 install --upgrade pip pynvim
RUN gem install -N \
    etc \
    json \
    rubocop \
    rubocop-performance \
    rubocop-rails \
    rubocop-rspec \
    solargraph


ENV GOPATH=/root/go PATH=${GOPATH}/bin:/usr/local/go/bin:$PATH GOBIN=$GOROOT/bin GO111MODULE=on TERM=xterm-color256

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

# install dein.vim
RUN curl -sf https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | sh -s /root/.cache/dein 

COPY nvim /root/.config/nvim

RUN nvim +:UpdateRemotePlugins +qa
RUN chmod -R 777 /root

ENTRYPOINT ["nvim"]
