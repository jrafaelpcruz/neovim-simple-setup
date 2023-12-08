#!/bin/bash

#Atualizando sistema
echo 'Atualizando apt'
sudo apt update -y
sudo apt upgrade -y

#Verificando condição pós fechamento do terminal
if [ ! -f scriptrestart1 ]; then

    #Instalando Tmux
    echo 'Instalando tmux'
    sudo apt install tmux -y

    #Instalando Neovim
    echo 'Instalando neovim'
    sudo apt install neovim -y

    #Instalando Fira Code font
    echo 'Instalando Fira Code font'
    curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraMono.tar.xz
    if [ ! -f FiraMono.tar.xz ]; then
        echo 'Não foi possivel realizar o download de FiraMono.tar.xz'
        exit 1
    fi
    mkdir firamono
    mv FiraMono.tar.xz firamono/
    cd firamono/
    tar -xf FiraMono.tar.xz
    rm FiraMono.tar.xz
    echo 'Verificando se a pasta fonts existe'
    if [ -d "$HOME/.local/share/fonts"]; then
        echo 'Pasta já existe'
    else
        echo 'Criando pasta fonts'
        mkdir $HOME/.local/share/fonts
    fi
    mv * $HOME/.local/share/fonts
    cd ..
    rm -r firamono
    fc-cache -fv

    #Instalando Oh My Tmux config
    cd
    git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
    cd $HOME/setup-nvim/

    #Movendo init.vim
    if [ -d "$HOME/.config/nvim/" ]; then
        echo 'Pasta já existe'
    else
        echo 'Criando pasta nvim'
        mkdir $HOME/.config/nvim
    fi
    cp init.vim $HOME/.config/nvim/

    #Executando comando para instalar vim-plugin
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    #Instalando nodejs, nvm e npm para habilitar CoC
    sudo apt install nodejs -y
    sudo apt install npm -y
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    touch scriptrestart1
    echo "Feche o terminal. Abra, execute nvim PlugInstall e então abra o script novamente."
    exit 1
else
    #Instalando a versao LTS do nodejs pelo nvm
    echo "Continuando instalação..."
    export NVM_DIR=$HOME/.nvm;
    source $NVM_DIR/nvm.sh;
    nvm install --lts

    #Verificando se PlugInstall foi executado
    if [ ! -d "$HOME/.local/share/nvim/plugged/" ]; then
        echo "Por favor execute :PlugInstall dentro do nvim."
        exit 1
    fi

    #Executando npm ci para uso adequado do CoC
    cd $HOME/.local/share/nvim/plugged/coc.nvim/
    npm ci
    cd $HOME/setup-nvim/

    #Verificando se a pasta plug-config existe
    if [ ! -d "$HOME/.config/nvim/plug-config" ]; then
        mkdir $HOME/.config/nvim/plug-config/ 
    fi

    #Movendo coc.vim para pasta plug-config
    cp coc.vim $HOME/.config/nvim/plug-config/
fi
