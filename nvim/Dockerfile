FROM alpine:latest

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:ja" LC_ALL="en_US.UTF-8"

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
    ripgrep \
    lazygit \
    ripgrep \
    && \
    rm -rf /var/cache/apk/*

RUN pip3 install --upgrade pip pynvim \
    && gem install -N \
    etc \
    json \
    rubocop \
    rubocop-performance \
    rubocop-rails \
    rubocop-rspec \
    solargraph \
    && sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' 


ENV GOPATH=/root/go PATH=${GOPATH}/bin:/usr/local/go/bin:$PATH GOBIN=$GOROOT/bin GO111MODULE=on TERM=xterm-color256

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin && mkdir -p /root/.config/nvim

RUN go install golang.org/x/tools/gopls@latest && go install golang.org/x/tools/cmd/goimports@latest

COPY ./nvim /root/.config/nvim

RUN nvim +:PlugInstall +qa && chmod -R 777 /root

ENTRYPOINT ["nvim"]
